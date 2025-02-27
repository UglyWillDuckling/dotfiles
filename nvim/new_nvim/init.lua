--
--
-- NOTE: these will need to be looked
-- Global variables.
vim.g.projects_dir = vim.env.HOME .. "/dev/projects"
vim.g.personal_projects_dir = vim.g.projects_dir .. "/Personal"
vim.g.work_projects_dir = "/Volumes/git"

-- Set my colorscheme.
vim.cmd.colorscheme("miss-dracula")

-- Install Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp = vim.opt.rtp ^ lazypath

---@type LazySpec
local plugins = "plugins"

-- General setup and goodies (order matters here).
require("settings")
require("keymaps")
require("commands")
require("autocmds")
require("statusline")
require("winbar")
require("lsp")

-- Configure plugins.
require("lazy").setup(plugins, {
  ui = { border = "rounded" },
  dev = { path = vim.g.projects_dir },
  install = {
    -- Do not automatically install on startup.
    missing = true, -- NOTE: check this too
  },
  -- Don't bother me when tweaking plugins.
  change_detection = { notify = true }, -- NOTE: check one time
  -- None of my plugins use luarocks so disable this.
  rocks = {
    enabled = true, -- NOTE: check this one later
  },
  performance = {
    rtp = {
      -- Stuff I don't use.
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
