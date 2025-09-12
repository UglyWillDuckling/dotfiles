
nnoremap <leader>cpc :call ClassName()<cr>

function! ClassName()
    let filePath = expand('%:p')
    let @+=system('phpactor class:reflect ' . filePath . ' | head -n 1 | cut -d: -f2 | tr -d "\n\r" | sed "s/^/\\\/"')
endfunction
