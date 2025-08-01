return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- LSP wrapper for vtsls.
            'yioneko/nvim-vtsls',
        },
        config = function()
            require('lspconfig.ui.windows').default_options.border = 'rounded'

            local configure_server = require('lsp').configure_server

            vim.lsp.enable 'solargraph'
            vim.lsp.enable 'arduino_language_server'
            vim.lsp.enable 'twiggy_language_server'

            vim.lsp.enable 'djlsp'
            require('lspconfig').pyright.setup {
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },
            }

            require('lspconfig').phpactor.setup {}
            require('lspconfig').jsonls.setup {}
            require('lspconfig').taplo.setup {}
            require('lspconfig').ruff.setup {
                settings = { format = false },
            }
            require('lspconfig').pyright.setup {
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },
            }
            -- Servers without extra configuration.
            configure_server 'bashls'
            configure_server 'cssls'
            configure_server 'dprint'
            -- configure_server 'html'
            configure_server 'zls'

            local html_capabilities = vim.lsp.protocol.make_client_capabilities()
            html_capabilities.textDocument.completion.completionItem.snippetSupport = true

            require('lspconfig').html.setup {
                capabilities = html_capabilities,
                filetypes = { 'html', 'blade' },
                init_options = {
                    configurationSection = { 'html', 'css', 'javascript' },
                    embeddedLanguages = {
                        css = true,
                        javascript = false,
                    },
                    provideFormatter = true,
                },
            }

            configure_server('clangd', {
                cmd = {
                    'clangd',
                    '--clang-tidy',
                    '--header-insertion=iwyu',
                    '--completion-style=detailed',
                    '--fallback-style=none',
                    '--function-arg-placeholders=false',
                },
            })

            configure_server('eslint', {
                filetypes = {
                    'graphql',
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                },
                settings = { format = false },
                on_attach = function(_, bufnr)
                    vim.keymap.set(
                        'n',
                        '<leader>ce',
                        '<cmd>EslintFixAll<cr>',
                        { desc = 'Fix all ESLint errors', buffer = bufnr }
                    )
                end,
            })

            configure_server('jsonls', {
                settings = {
                    json = {
                        validate = { enable = true },
                    },
                },
                -- Lazy-load schemas.
                on_new_config = function(config)
                    config.settings.json.schemas = config.settings.json.schemas or {}
                    vim.list_extend(config.settings.json.schemas, require('schemastore').json.schemas())
                end,
            })

            configure_server('lua_ls', {
                ---@param client vim.lsp.Client
                on_init = function(client)
                    local path = client.workspace_folders
                        and client.workspace_folders[1]
                        and client.workspace_folders[1].name
                    if
                        not path
                        or not (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        '${3rd}/luv/library',
                                    },
                                },
                            },
                        })
                        client:notify(
                            vim.lsp.protocol.Methods.workspace_didChangeConfiguration,
                            { settings = client.config.settings }
                        )
                    end

                    return true
                end,
                settings = {
                    Lua = {
                        -- Using stylua for formatting.
                        format = { enable = false },
                        hint = {
                            enable = true,
                            arrayIndex = 'Disable',
                        },
                        completion = { callSnippet = 'Replace' },
                    },
                },
            })

            configure_server('rust_analyzer', {
                settings = {
                    ['rust-analyzer'] = {
                        inlayHints = {
                            -- These are a bit too much.
                            chainingHints = { enable = false },
                        },
                    },
                },
            })

            configure_server('stylelint_lsp', {
                settings = {
                    stylelintplus = {
                        -- Lint on save instead of on type.
                        validateOnSave = true,
                        validateOnType = false,
                    },
                },
            })

            configure_server('taplo', {
                settings = {
                    -- Use the defaults that the VSCode extension uses: https://github.com/tamasfe/taplo/blob/2e01e8cca235aae3d3f6d4415c06fd52e1523934/editors/vscode/package.json
                    taplo = {
                        configFile = { enabled = true },
                        schema = {
                            enabled = true,
                            catalogs = { 'https://www.schemastore.org/api/json/catalog.json' },
                            cache = {
                                memoryExpiration = 60,
                                diskExpiration = 600,
                            },
                        },
                    },
                },
            })

            -- Use the same settings for JS and TS.
            local lang_settings = {
                suggest = { completeFunctionCalls = true },
                inlayHints = {
                    functionLikeReturnTypes = { enabled = true },
                    parameterNames = { enabled = 'literals' },
                    variableTypes = { enabled = true },
                },
            }
            configure_server('vtsls', {
                settings = {
                    typescript = lang_settings,
                    javascript = lang_settings,
                    vtsls = {
                        -- Automatically use workspace version of TypeScript lib on startup.
                        autoUseWorkspaceTsdk = true,
                        experimental = {
                            -- Inlay hint truncation.
                            maxInlayHintLength = 30,
                            -- For completion performance.
                            completion = {
                                enableServerSideFuzzyMatch = true,
                            },
                        },
                    },
                },
            })

            configure_server('yamlls', {
                settings = {
                    yaml = {
                        -- Using the schemastore plugin instead.
                        schemastore = {
                            enable = false,
                            url = '',
                        },
                    },
                },
                -- Lazy-load schemas.
                on_new_config = function(config)
                    config.settings.yaml.schemas = config.settings.yaml.schemas or {}
                    vim.list_extend(config.settings.yaml.schemas, require('schemastore').yaml.schemas())
                end,
            })
        end,
    },
}
