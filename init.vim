set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set termguicolors
nnoremap <silent> <BS> <c-w>h

" ------------------NVIM CONFIG------------------

Plugin 'jiangmiao/auto-pairs'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'nvim-tree/nvim-tree.lua'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'sindrets/diffview.nvim'
Plugin 'phaazon/hop.nvim'
Plugin 'nvim-lualine/lualine.nvim'
Plugin 'Pocco81/true-zen.nvim'
" https://github.com/neoclide/coc.nvim
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup." Find files using Telescope command-line sugar.

" easily reload the .rc file
noremap <F1> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p> <cmd>Telescope registers<cr>

nnoremap s :HopWord<CR>
nnoremap <M-k> :HopChar1<CR>
nnoremap <M-l> :HopLine<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

nnoremap <C-n> :NERDTree<CR>

nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>
nnoremap <C-t> :NvimTreeToggle<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = vim.api

require'hop'.setup()
require('lualine').setup()

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
require("true-zen").setup()

require("nvim-tree").setup({
sort_by = "case_sensitive",
view = {
    width = 33,
},
renderer = {
    group_empty = true,
},
filters = {
    dotfiles = false,
},
})
EOF
