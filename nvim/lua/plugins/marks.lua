return {
    {
        'chentoast/marks.nvim',
        lazy = true,
        event = 'BufEnter',

        opts = {
            mappings = {
                delete = 'dm',
                set_next = 'm,',
                next = 'm]',
                preview = 'm:',
                next_bookmark0 = '<M-]>',
                prev_bookmark0 = '<M-[>',
            },
            bookmark_0 = { sign = '⚑', virt_text = '' },
        },
    },
}
