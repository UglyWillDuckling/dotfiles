return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {},
        highlight = { enable = true },
        indent = {
            enable = true,
            -- Treesitter unindents Yaml lists for some reason.
            disable = { 'yaml' },
        },
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                dependencies = { 'nvim-treesitter/nvim-treesitter' },
                event = 'VeryLazy',
                opts = {
                    max_lines = 3, -- how many context lines to show at most
                    min_window_height = 0,
                    line_numbers = true,
                    multiline_threshold = 20,
                    trim_scope = 'outer', -- or 'inner'
                    mode = 'cursor', -- or 'topline'
                    separator = nil, -- e.g. '─' for a divider line under the context
                    zindex = 20,
                    on_attach = nil,
                },
            },
        },
        config = function()
            local ensure_installed = {
                'c',
                'cpp',
                'lua',
                'vim',
                'vimdoc',
                'query',
                'bash',
                'json',
                'yaml',
                'markdown',
                'javascript',
                'typescript',
                'html',
                'css',
                'php',
                'python',
            }

            require('nvim-treesitter').install(ensure_installed)

            -- turn on highlighting for those filetypes
            vim.api.nvim_create_autocmd('FileType', {
                pattern = ensure_installed,
                callback = function()
                    vim.treesitter.start()

                    -- indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                    -- folding
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo.foldmethod = 'expr'
                end,
            })
        end,
    },
    {
        -- https://github.com/shushtain/incselect.nvim
        'maxischmaxi/inc-select.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = 'VeryLazy',
        opts = {
            keymaps = {
                init_selection = '<S-l>', -- normal mode
                node_incremental = '<S-l>', -- visual mode
                -- scope_incremental = '<S-space>', -- visual mode
                node_decremental = '<S-h>', -- visual mode
            },
        },
    },
}
