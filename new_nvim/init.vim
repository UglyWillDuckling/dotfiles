
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUT TO REFERENCE CURRENT FILE'S PATH IN COMMAND LINE MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'

function! SourceConfig()
  let path = $HOME  . '/.config/nvim/vim'

  let file_list = split(globpath(path, '*.vim'), '\n')

  for file in file_list
    execute 'source' fnameescape(file)
  endfor

  source ~/.config/nvim/start.lua
endfunction

call SourceConfig()

nnoremap <expr> g<c-v> '`[' . getregtype()[0] . '`]'
nnoremap <F1> :so ~/.config/nvim/init.vim<CR>
nnoremap <F4> :e!<CR>

nmap <leader><Tab> gt
nmap <S-Tab> gT

" <leader><leader> is more convenient than <c-^>
nnoremap <leader><leader> <c-^>

" Can't be bothered to understand ESC vs <c-c> in insert mode
inoremap <c-c> <esc>

set notimeout
