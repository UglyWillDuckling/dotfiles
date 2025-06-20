return {
    {
        'folke/todo-comments.nvim',
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = 'VeryLazy',
        opts = {
            keywords = {
                FIX = {
                    icon = ' ', -- icon used for the sign, and in search results
                    color = 'error', -- can be a hex color, or a named color (see below)
                    alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = ' ', color = 'default' },
                HACK = { icon = ' ', color = 'warning' },
                WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
                PERF = { icon = ' ', color = '#ff8055', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                NOTE = { icon = ' ', color = '#00aa7f' },
                TEST = { icon = '⏲ ', color = '#03ad12', alt = { 'TESTING', 'PASSED', 'FAILED' } },
                KNOW = { icon = '📖', color = 'default' }, -- blueish
                IDEA = { icon = '💡', color = '#ded903' }, -- yellow
                SUGGEST = { icon = ' ', color = '#fd56d2' },
                THOUGHT = { icon = '🧠', color = '#3189f8' }, -- purple
                QUESTION = { icon = '❓', color = 'hint' },
            },
        },
    },
}
--
--IDEA: https://github.com/folke/todo-comments.nvim
-- :brain:
-- THOUGHT: hello
-- KNOW: you need to know this
-- INFO: hello
-- TODO: todo
-- HACK: hacked this one
-- WARN: don't do this
-- PERF: performance issue with timing
-- NOTE: remember this
-- TEST: need to test
-- SUGGEST: code suggestions
-- FIX:  another fix
