-- Auto-completion:
return {
    {
        'saghen/blink.cmp',
        dependencies = {
            {
                'Kaiser-Yang/blink-cmp-dictionary',
                dependencies = { 'nvim-lua/plenary.nvim' },
            },
            {
                'LuaSnip',
            },
        },
        build = 'cargo +nightly build --release',
        event = 'InsertEnter',
        opts = {
            enabled = function()
                return not vim.tbl_contains({ 'markdown' }, vim.bo.filetype)
            end,
            keymap = {
                ['<CR>'] = { 'accept', 'fallback' },
                ['<C-\\>'] = { 'hide', 'fallback' },
                ['<C-1>'] = {
                    function(cmp)
                        cmp.accept { index = 1 }
                    end,
                },
                ['<C-2>'] = {
                    function(cmp)
                        cmp.accept { index = 2 }
                    end,
                },
                ['<C-3>'] = {
                    function(cmp)
                        cmp.accept { index = 3 }
                    end,
                },
                ['<C-4>'] = {
                    function(cmp)
                        cmp.accept { index = 4 }
                    end,
                },
                ['<C-5>'] = {
                    function(cmp)
                        cmp.accept { index = 5 }
                    end,
                },
                ['<C-6>'] = {
                    function(cmp)
                        cmp.accept { index = 6 }
                    end,
                },
                ['<C-7>'] = {
                    function(cmp)
                        cmp.accept { index = 7 }
                    end,
                },
                ['<C-8>'] = {
                    function(cmp)
                        cmp.accept { index = 8 }
                    end,
                },
                ['<C-9>'] = {
                    function(cmp)
                        cmp.accept { index = 9 }
                    end,
                },
                ['<C-0>'] = {
                    function(cmp)
                        cmp.accept { index = 10 }
                    end,
                },
                ['<C-n>'] = { 'select_next', 'show' },
                ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
                ['<C-p>'] = { 'select_prev' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                -- disable a keymap from the preset
                ['<C-e>'] = {},
            },
            completion = {
                list = {
                    -- Insert items while navigating the completion list.
                    selection = { preselect = false, auto_insert = true },
                    max_items = 15,
                },
                menu = {
                    border = 'rounded',
                },
                documentation = {
                    auto_show = true,
                    window = { border = 'rounded' },
                },
            },
            snippets = { preset = 'luasnip' },
            -- Disable command line completion:
            cmdline = { enabled = false },
            sources = {
                -- Disable some sources in comments and strings.
                default = function()
                    local sources = { 'lsp', 'buffer', 'dictionary' }
                    local ok, node = pcall(vim.treesitter.get_node)

                    if ok and node then
                        if not vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                            table.insert(sources, 'path')
                        end
                        if node:type() ~= 'string' then
                            table.insert(sources, 'snippets')
                        end
                    end

                    return sources
                end,
                providers = {
                    dictionary = {
                        module = 'blink-cmp-dictionary',
                        name = 'Dict',
                        -- Make sure this is at least 2.
                        min_keyword_length = 4,
                        opts = {
                            -- options for blink-cmp-dictionary
                            -- dictionary_directories = { vim.fn.expand '~/.config/nvim/dicts' },
                            dictionary_files = function()
                                if vim.bo.filetype == 'markdown' then
                                    return { vim.fn.expand '~/.config/nvim/dicts/words.txt' }
                                end
                                return {}
                            end,
                            decapitalize_first = true,
                        },
                    },
                },
            },
            appearance = {
                kind_icons = require('icons').symbol_kinds,
            },
        },
    },
}
