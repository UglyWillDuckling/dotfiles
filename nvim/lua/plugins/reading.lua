return {
    {

        'vimwiki/vimwiki',
    },
    {
        'preservim/vim-markdown',
    },
    {
        -- https://github.com/MeanderingProgrammer/render-markdown.nvim
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
}
