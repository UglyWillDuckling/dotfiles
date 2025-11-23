return {
    'atiladefreitas/dooing',
    config = function()
        require('dooing').setup {
            -- Window settings
            window = {
                width = 65, -- Width of the floating window
                height = 23, -- Height of the floating window
                position = 'bottom-left', -- 'right', 'left', 'top', 'bottom', 'center',
                -- 'top-right', 'top-left', 'bottom-right', 'bottom-left'
            },
            keymaps = {
                toggle_window = '<leader>dg', -- Toggle global todos
                open_project_todo = '<leader>dd', -- Toggle project-specific todos
                create_nested_task = '<S-n>', -- Create nested subtask under current todo
                new_todo = 'i',
                toggle_todo = 'x',
                delete_todo = 'd',
                delete_completed = 'D',
                close_window = 'q',
                undo_delete = 'u',
                add_due_date = 'H',
                remove_due_date = 'r',
                toggle_help = '?',
                toggle_tags = 't',
                toggle_priority = 'p',
                clear_filter = 'c',
                edit_todo = 'e',
                edit_tag = 'e',
                edit_priorities = 'p',
                delete_tag = 'd',
                search_todos = '/',
                add_time_estimation = 'T',
                remove_time_estimation = 'R',
                import_todos = 'I',
                export_todos = 'E',
                remove_duplicates = '<leader>D',
                open_todo_scratchpad = 'c',
            },
            calendar = {
                language = 'en',
                icon = '🗓️',
                keymaps = {
                    previous_day = 'h',
                    next_day = 'l',
                    previous_week = 'k',
                    next_week = 'j',
                    previous_month = 'H',
                    next_month = 'L',
                    select_day = '<CR>',
                    close_calendar = 'q',
                },
            },
        }
    end,
}
