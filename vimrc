set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin on
runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" https://github.com/wellle/targets.vim
Plugin 'wellle/targets.vim'

" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" https://github.com/vim-scripts/DrawIt
Plugin 'vim-scripts/DrawIt'

" https://github.com/tpope/vim-obsession
Plugin 'tpope/vim-obsession'

" https://github.com/tpope/vim-abolish
Plugin 'tpope/vim-abolish'

" https://github.com/chrisbra/Colorizer
Plugin 'chrisbra/Colorizer'

" https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'

" https://github.com/justinmk/vim-sneak
Plugin 'justinmk/vim-sneak'

" https://github.com/kana/vim-textobj-user
Plugin 'kana/vim-textobj-user'

" https://github.com/rayburgemeestre/phpfolding.vim
Plugin 'kana/vim-textobj-fold'

" https://github.com/junegunn/vim-peekaboo registers
" Plugin 'junegunn/vim-peekaboo'

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" https://gitlab.com/gi1242/vim-emoji-ab.git
Plugin 'https://gitlab.com/gi1242/vim-emoji-ab.git'

" https://github.com/prettier/vim-prettier
Plugin 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['php'] }

" https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" https://github.com/morhetz/gruvbox/
Plugin 'morhetz/gruvbox'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Comment Plugin https://github.com/yaocccc/vim-comment
" Plugin 'yaocccc/vim-comment'

" Comment plugin https://github.com/tomtom/tcomment_vim
Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-sleuth'

Plugin 'romainl/vim-cool'

" https://github.com/tpope/vim-rsi
Plugin 'tpope/vim-rsi'

" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" https://github.com/tpope/vim-repeat
Plugin 'tpope/vim-repeat'

" https://github.com/tpope/vim-unimpaired
Plugin 'tpope/vim-unimpaired'

" https://github.com/svermeulen/vim-easyclip
Plugin 'svermeulen/vim-easyclip'

Plugin 'tpope/vim-fugitive'

" https://github.com/pangloss/vim-javascript
" Plugin 'https://github.com/pangloss/vim-javascript'

" https://github.com/vim-autoformat/vim-autoformat
Plugin 'vim-autoformat/vim-autoformat'

" add this line to your .vimrc file
Plugin 'mattn/emmet-vim'

" Plugin 'ycm-core/YouCompleteMe'

Plugin 'godlygeek/tabular'
" https://github.com/preservim/vim-markdown
Plugin 'preservim/vim-markdown'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:gruvbox_contrast_light = 'hard'
" let g:gruvbox_improved_strings = 1
" GruvBox Init
autocmd vimenter * ++nested colorscheme gruvbox

syntax enable

" COLORSCHEME light/dark set
if strftime("%H") < 21 && strftime("%H") > 7
    set background=light
else
    set background=dark
endif

" vim-autoformat configuration
let g:python3_host_prog="/usr/bin/python"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber  " Enable relative line numbers
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" Always show tab bar at the top
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
noremap \ ,
" fix the changelist backword jump
nnoremap g\ g,
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1
" Stop SQL language files from doing unholy things to the C-c key
let g:omni_sql_no_default_maps = 1
" Diffs are shown side-by-side not above/below
set diffopt=vertical
" Always show the sign column
" set signcolumn=no
" True color mode! (Requires a fancy modern terminal, but iTerm works.)
:set termguicolors
" Write swap files to disk and trigger CursorHold event faster (default is
" after 4000 ms of inactivity)
:set updatetime=200
" Completion options.
"   menu: use a popup menu
"   preview: show more info in menu
:set completeopt=menu,preview
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Use persistent undo history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 mapping to easily reload this .rc file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F1> :so ~/.vimrc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUT TO REFERENCE CURRENT FILE'S PATH IN COMMAND LINE MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Md5 COMMAND
" Show the MD5 of the current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -range Md5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a forward arrow
imap <c-s> ->
" Can't be bothered to understand ESC vs <c-c> in insert mode
inoremap <c-c> <esc>
" <leader><leader> is more convenient than <c-^>
nnoremap <leader><leader> <c-^>
" Align selected lines
vnoremap <leader>ib :!align<cr>
" Close all other splits
nnoremap <leader>o :only<cr>
" quicksave
nnoremap <leader>w :w<cr>
" fast visual split
nnoremap <silent> vv <C-w>v
" Visual selection search alt+/
vnoremap / <Esc>/\%V
" just create a split when jumping to a file, works for gF
nnoremap gf <C-W>f
" Write out the current file path
nnoremap e :!echo %<CR>
" replace current word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" search remappings to enable very magic mode by default
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
cnoremap g/ :g/\v

" alt+h
nnoremap h <Esc>:History<CR>

" swap words
nmap <silent> gw :s/\(\w*\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr>

" Abbreviations
iabbrev for@ for(let i = 0; i <z; i++) {<CR><CR>}<Esc>?z<CR>xi

" delete current buffer
:nnoremap <Leader>q :Bdelete<CR>

" SPACE to toggle FOLDS
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-p>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse use in all modes
set mouse=a

" use the system clipboard by default
set clipboard^=unnamedplus

" EastClip
let g:EasyClipAutoFormat = 1

" Git
au FileType gitcommit set tw=68 spell
" add hyphen to the iskeyword list
set iskeyword+=-

" Special Chars
:set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

set timeoutlen=1500
" Treat all numbers as decimal
set nrformats=
set wildmenu
set wildmode=full
set history=200

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no wrapping
:autocmd BufNewFile,BufRead *.html setlocal nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

nnoremap Y y$

" AutoFormat
noremap <F3> :Autoformat<CR>
" let g:autoformat_verbosemode=1
let g:formatters_js = ['eslint_local']

set mmp=8000

" Surround
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" Remove trailing whitespace https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Clip
" map mark to gm
nnoremap gm m

" emoji file types
au FileType rs,html,php,markdown,mmd,text,mail,gitcommit runtime macros/emoji-ab.vim

function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Fugitive
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gl :0Gclog<CR>
vmap <leader>gl :Gclog<CR>

" from https://github.com/skwp/dotfiles/blob/master/vim/settings/yadr-window-killer.vim

" Use Q to intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

    " We should never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') == 'NERD'
        wincmd c
        return
    endif

    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" XML Folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Spell Check
au FileType markdown set spell spelllang=en_us
augroup color_fix | au!
    autocmd ColorScheme * hi! SpellBad cterm=underline
    autocmd ColorScheme * hi! ColorColumn ctermbg=magenta guibg=Magenta
augroup end

" HTML wrapping
:autocmd BufNewFile,BufRead *.html setlocal nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let g:asyncrun_open = 11
" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(11)<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf Vim Grep command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :Ag<space>
nnoremap <leader>A :exec "Ag ".expand("<cword>")<cr>

autocmd VimEnter * command! -nargs=* Ag
            \ call fzf#vim#grep(
            \   'ag  -U --column --line-number --no-heading --color --color-path "0;35" --color-match "46" --color-line-number "42" --hidden --ignore ".git" --ignore "app/code/OSI/MapViewer/view/frontend/web/vendor" '.<q-args>, 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

nnoremap c :call ClassName()<cr>
function! ClassName()
    let filePath = expand('%:p')
    let @c = system('phpactor class:reflect ' . filePath . ' | head -n 1 | cut -d: -f2 | tr -d "\n\r" | sed "s/^/\\\/"')
endfunction

" +----------------------------------------+
" |  Move selected block in visual mode    |
" +----------------------------------------+
vnoremap <Right> lholhxp`[1v
vnoremap <Left> hlohlxhP`[1v
vnoremap <Down> jkojkxjzvP`[1v
vnoremap <Up> kjokjxkzvP`[1v

" +-------------------------------+
" |         Tabularize            |
" +-------------------------------+
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" +-------------------------------+
" |             emoji             |
" +-------------------------------+
au FileType ruby,rb,html,php,markdown,mmd,text,mail,gitcommit
            \ runtime macros/emoji-ab.vim

autocmd FileType make setlocal noexpandtab

