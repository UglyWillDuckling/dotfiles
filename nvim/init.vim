
let mapleader=","
"
" Escape insert mode more easily (quickly press jj )
" NOTE: testing stage, move to lua/keymaps.lua
imap jj <Esc>

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

nmap ,wo <Plug>VimwikiFollowLink

nnoremap <leader><leader> <c-^>
nnoremap z, za

function! SourceConfig()
  let path = $HOME  . '/.config/nvim/vim'

  let file_list = split(globpath(path, '*.vim'), '\n')

  for file in file_list
    execute 'source' fnameescape(file)
  endfor

  source ~/.config/nvim/start.lua
endfunction

call SourceConfig()
