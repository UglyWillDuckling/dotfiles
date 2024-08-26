"
imap <script><silent><nowait><expr> <C-g> codeium#Accept()

silent! call repeat#set("\<Plug>(codeium-accept)", 1)

silent! call repeat#set("codeium#Accept", 1)

function! SourceConfig()
  let path = $HOME  . '/.config/nvim/vim'
  " let path .= ',' . $HOME  . '/dotfiles/vim/config/plugins'

  let file_list = split(globpath(path, '*.vim'), '\n')

  for file in file_list
    execute 'source' fnameescape(file)
  endfor

  source ~/.config/nvim/start.lua
endfunction

call SourceConfig()

