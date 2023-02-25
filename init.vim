set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set termguicolors

nnoremap <silent> <BS> <c-w>h
