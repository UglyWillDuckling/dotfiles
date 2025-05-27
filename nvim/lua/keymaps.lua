vim.keymap.set('n', '<leader>us', ':set spell!<CR>', { desc = 'Toggle Spell' })

-- Remap for dealing with word wrap and adding jumps to the jumplist
vim.keymap.set('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
vim.keymap.set('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- Keeping the cursor centered.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Indent while remaining in visual mode.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Open the package manager.
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Switch between windows.
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the bottom window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the top window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window', remap = true })

-- Tab navigation.
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close tab page' })
vim.keymap.set('n', '<leader>tn', '<cmd>tab split<cr>', { desc = 'New tab page' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close other tab pages' })

-- Poweful <esc>.
vim.keymap.set({ 'i', 's', 'n' }, '<esc>', function()
    if require('luasnip').expand_or_jumpable() then
        require('luasnip').unlink_current()
    end
    vim.cmd 'noh'
    return '<esc>'
end, { desc = 'Escape, clear hlsearch, and stop snippet session', expr = true })

-- Make U opposite to u.
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Escape and save changes.
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-s>', '<esc>:w<cr>', { desc = 'Exit insert mode and save changes.' })
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-S-s>', '<esc>:wa<cr>', { desc = 'Exit insert mode and save all changes.' })

-- Floating terminal.
-- Mapped to <C-/> actually, because of Tmux
vim.keymap.set({ 'n', 't' }, '<C-_>', function()
    require('float_term').float_term('zsh', { cwd = vim.fn.expand '%:p:h' })
end, { desc = 'Toggle floating terminal' })
-- duplicate mapping to support work outside of Tmux
vim.keymap.set({ 'n', 't' }, '<C-/>', function()
    require('float_term').float_term('zsh', { cwd = vim.fn.expand '%:p:h' })
end, { desc = 'Toggle floating terminal' })

vim.keymap.set('n', '<leader>ud', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { noremap = true, silent = true, desc = 'Toggle Vim diagnostics' })

-- resize windows
vim.keymap.set('n', '<Left>', function()
    require('smart-splits').resize_left()
end, {})

vim.keymap.set('n', '<Down>', function()
    require('smart-splits').resize_down()
end)

vim.keymap.set('n', '<Up>', function()
    require('smart-splits').resize_up()
end)

vim.keymap.set('n', '<Right>', function()
    require('smart-splits').resize_right()
end)

--
-- Neotest
--
vim.keymap.set('n', '<leader>r', function()
    require('neotest').run.run(vim.fn.expand '%')
end, { noremap = true, desc = 'Neotest - run File' })

vim.keymap.set('n', '<leader>tr', function()
    require('neotest').run.run(vim.fn.expand '%')
end, { noremap = true, desc = 'Neotest - run File' })

vim.keymap.set('n', '<leader>tn', function()
    require('neotest').run.run()
end, { noremap = true, desc = 'Neotest - run Nearest' })

vim.keymap.set('n', '<leader>ts', '<cmd>Neotest summary<CR>', { noremap = true, desc = 'Neotest - Summary Window' })

-- Copy buffer
vim.keymap.set('n', 'y,', ':normal gg yG <C-o> <C-o> zz zz<CR>', { noremap = true, desc = 'Copy the entire buffer' })

--
-- AI
--
-- keybinds for prompting with groq
vim.keymap.set('n', '<leader>m', function()
    require('llm').prompt { replace = false, service = 'groq' }
end, { desc = 'Prompt with groq' })
vim.keymap.set('v', '<leader>m', function()
    require('llm').prompt { replace = false, service = 'groq' }
end, { desc = 'Prompt with groq' })
vim.keymap.set('v', '<leader>.', function()
    require('llm').prompt { replace = true, service = 'groq' }
end, { desc = 'Prompt while replacing with groq' })

vim.keymap.set('n', '<leader>n', function()
    require('llm').create_llm_md()
end, { desc = 'Create llm.md' })


--  I've analyzed the code and provided suggestions for improvements, explanations, and potential bugs.

2. **Use comments and docstrings**: You've added some comments, but consider adding more docstrings to explain the purpose of each keymap and function.
    
--
