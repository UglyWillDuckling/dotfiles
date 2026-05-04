-- Split/join blocks of code.
return {
    {
        'Wansmer/treesj',
        dependencies = 'nvim-treesitter',
        keys = {
            -- TODO: check this out, split it up!!!
            { '<leader>cj', '<cmd>TSJToggle<cr>', desc = 'Join/split code block' },
        },
        opts = { use_default_keymaps = false },
    },
}
