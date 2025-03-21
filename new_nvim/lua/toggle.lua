---@class snacks.toggle
---@overload fun(... :snacks.toggle.Opts): snacks.toggle.Class
local M = setmetatable({}, {
    __call = function(M, ...)
        return M.new(...)
    end,
})

M.meta = {
    desc = 'Toggle keymaps integrated with which-key icons / colors',
}

---@class snacks.toggle.Config
---@field icon? string|{ enabled: string, disabled: string }
---@field color? string|{ enabled: string, disabled: string }
---@field wk_desc? string|{ enabled: string, disabled: string }
---@field map? fun(mode: string|string[], lhs: string, rhs: string|fun(), opts?: vim.keymap.set.Opts)
---@field which_key? boolean
---@field notify? boolean
local defaults = {
    map = vim.keymap.set, -- keymap.set function to use
    which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
    notify = true, -- show a notification when toggling
    -- icons for enabled/disabled states
    icon = {
        enabled = ' ',
        disabled = ' ',
    },
    -- colors for enabled/disabled states
    color = {
        enabled = 'green',
        disabled = 'yellow',
    },
    wk_desc = {
        enabled = 'Disable ',
        disabled = 'Enable ',
    },
}

---@type table<string, snacks.toggle.Class>
M.toggles = {}

---@class snacks.toggle.Opts: snacks.toggle.Config
---@field id? string
---@field name string
---@field get fun():boolean
---@field set fun(state:boolean)

---@class snacks.toggle.Class
---@field opts snacks.toggle.Opts
local Toggle = {}
Toggle.__index = Toggle

---@param ... snacks.toggle.Opts
function M.new(...)
    ---@type snacks.toggle.Class
    local self = setmetatable({}, Toggle)
    -- self.opts = defaults
    -- local id = self.opts.id or self.opts.name:lower():gsub('%W+', '_'):gsub('_+$', ''):gsub('^_+', '')
    -- self.opts.id = id
    -- M.toggles[id] = self
    return self
end

---@param id string
---@return snacks.toggle.Class?
function M.get(id)
    if not M.toggles[id] and M[id] then
        M[id]()
    end
    return M.toggles[id]
end

function Toggle:get()
    local ok, ret = pcall(self.opts.get)
    if not ok then
        -- Snacks.notify.error({
        --     'Failed to get state for `' .. self.opts.name .. '`:\n',
        --     ret --[[@as string]],
        -- }, { title = self.opts.name, once = true })
        return false
    end
    return ret
end

---@param state boolean
function Toggle:set(state)
    local ok, err = pcall(self.opts.set, state) ---@type boolean, string?
    if not ok then
        -- Snacks.notify.error({
        --     'Failed to set state for `' .. self.opts.name .. '`:\n',
        --     err --[[@as string]],
        -- }, { title = self.opts.name, once = true })
    end
end

function Toggle:toggle()
    local state = not self:get()
    self:set(state)
    if self.opts.notify then
        -- Snacks.notify(
        --     (state and 'Enabled' or 'Disabled') .. ' **' .. self.opts.name .. '**',
        --     { title = self.opts.name, level = state and vim.log.levels.INFO or vim.log.levels.WARN }
        -- )
    end
end

---@param keys string
---@param opts? vim.keymap.set.Opts | { mode: string|string[]}
-- function Toggle:map(keys, opts)
--     opts = opts or {}
--     local mode = opts.mode or 'n'
--     opts.mode = nil
--     opts.desc = opts.desc or ('Toggle ' .. self.opts.name)
--     self.opts.map(mode, keys, function()
--         self:toggle()
--     end, opts)
--     if self.opts.which_key then
--         Snacks.util.on_module('which-key', function()
--             self:_wk(keys, mode)
--         end)
--     end
--     return self
-- end

function Toggle:_wk(keys, mode)
    require('which-key').add {
        {
            keys,
            mode = mode,
            real = true,
            icon = function()
                local key = self:get() and 'enabled' or 'disabled'
                return {
                    icon = type(self.opts.icon) == 'string' and self.opts.icon or self.opts.icon[key],
                    color = type(self.opts.color) == 'string' and self.opts.color or self.opts.color[key],
                }
            end,
            desc = function()
                local key = self:get() and 'enabled' or 'disabled'
                return (type(self.opts.wk_desc) == 'string' and self.opts.wk_desc or self.opts.wk_desc[key])
                    .. self.opts.name
            end,
        },
    }
end

---@param option string
---@param opts? snacks.toggle.Config | {on?: unknown, off?: unknown, global?: boolean}
function M.option(option, opts)
    opts = opts or {}
    local on = opts.on == nil and true or opts.on
    local off = opts.off ~= nil and opts.off or false
    return M.new({
        id = option,
        name = option,
        get = function()
            if opts.global then
                return vim.opt[option]:get() == on
            end
            return vim.opt_local[option]:get() == on
        end,
        set = function(state)
            if opts.global then
                vim.opt[option] = state and on or off
                return
            end
            vim.opt_local[option] = state and on or off
        end,
    }, opts)
end

---@param opts? snacks.toggle.Config
function M.treesitter(opts)
    return M.new({
        id = 'treesitter',
        name = 'Treesitter Highlight',
        get = function()
            return vim.b.ts_highlight
        end,
        set = function(state)
            vim.treesitter[state and 'start' or 'stop']()
        end,
    }, opts)
end

---@param opts? snacks.toggle.Config
function M.line_number(opts)
    local number, relativenumber = true, true
    return M.new({
        id = 'line_number',
        name = 'Line Numbers',
        get = function()
            return vim.opt_local.number:get() or vim.opt_local.relativenumber:get()
        end,
        set = function(state)
            if state then
                vim.opt_local.number, vim.opt_local.relativenumber = number, relativenumber
            else
                number, relativenumber = vim.opt_local.number:get(), vim.opt_local.relativenumber:get()
                vim.opt_local.number, vim.opt_local.relativenumber = false, false
            end
        end,
    }, opts)
end

---@param opts? snacks.toggle.Config
function M.inlay_hints(opts)
    return M.new({
        id = 'inlay_hints',
        name = 'Inlay Hints',
        get = function()
            return vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
        end,
        set = function(state)
            vim.lsp.inlay_hint.enable(state, { bufnr = 0 })
        end,
    }, opts)
end

---@param opts? snacks.toggle.Config
function M.diagnostics(opts)
    return M.new({
        id = 'diagnostics',
        name = 'Diagnostics',
        get = function()
            local enabled = false
            if vim.diagnostic.is_enabled then
                enabled = vim.diagnostic.is_enabled()
            elseif vim.diagnostic.is_disabled then
                enabled = not vim.diagnostic.is_disabled()
            end
            return enabled
        end,
        set = function()
            local state = self.get()
            if vim.fn.has 'nvim-0.10' == 0 then
                if state then
                    pcall(vim.diagnostic.enable)
                else
                    pcall(vim.diagnostic.disable)
                end
            else
                vim.diagnostic.enable(state)
            end
        end,
    }, opts)
end

---@private
function M.health()
    local ok = pcall(require, 'which-key')
    -- Snacks.health[ok and 'ok' or 'warn'](('{which-key} is %s'):format(ok and 'installed' or 'not installed'))
end

-- function M.indent()
--     return M.new {
--         id = 'indent',
--         name = 'Indent Guides',
--         get = function()
--             return Snacks.indent.enabled
--         end,
--         set = function(state)
--             if state then
--                 Snacks.indent.enable()
--             else
--                 Snacks.indent.disable()
--             end
--         end,
--     }
-- end

function M.animate()
    return M.new {
        id = 'animate',
        name = 'Animations',
        get = function()
            return vim.g.snacks_animate ~= false
        end,
        set = function(state)
            vim.g.snacks_animate = state
        end,
    }
end

-- TODO: handle the global func
function toggleDiagnostics()
    if vim.diagnostic.is_enabled() then
        pcall(vim.diagnostic.disable)
    else
        pcall(vim.diagnostic.enable)
    end
end

vim.keymap.set('n', '<leader>ud', toggleDiagnostics, { desc = 'Toggle Diag' })

return M
