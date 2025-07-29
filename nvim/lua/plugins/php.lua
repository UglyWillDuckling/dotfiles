return {
    {
        'adalessa/laravel.nvim',
        dependencies = {
            'tpope/vim-dotenv',
            'nvim-telescope/telescope.nvim',
            'MunifTanjim/nui.nvim',
            'kevinhwang91/promise-async',
        },
        cmd = { 'Laravel' },
        keys = {
            { '<leader>la', ':Laravel artisan<cr>' },
            { '<leader>lr', ':Laravel routes<cr>' },
            { '<leader>lm', ':Laravel related<cr>' },
        },
        event = { 'VeryLazy' },
        opts = {},
        config = true,
    },
    {
        'ricardoramirezr/blade-nav.nvim',
        dependencies = { -- totally optional
            'hrsh7th/nvim-cmp', -- if using nvim-cmp
            { 'ms-jpq/coq_nvim', branch = 'coq' }, -- if using coq
            'saghen/blink.cmp', -- if using blink.cmp
        },
        ft = { 'blade', 'php' }, -- optional, improves startup time
        opts = {
            -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
            close_tag_on_complete = true, -- default: true
        },
    },
}
