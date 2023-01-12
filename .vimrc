set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin on
runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" https://github.com/vim-airline/vim-airline Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" https://gitlab.com/gi1242/vim-emoji-ab.git
Plugin 'https://gitlab.com/gi1242/vim-emoji-ab.git'

Plugin 'vim-syntastic/syntastic'

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

" https://github.com/glts/vim-magnum
Plugin 'glts/vim-magnum'

" https://github.com/pangloss/vim-javascript
Plugin 'https://github.com/pangloss/vim-javascript'

" https://github.com/vim-autoformat/vim-autoformat
Plugin 'vim-autoformat/vim-autoformat'

" https://phpactor.readthedocs.io/en/master/usage/vim-plugin.html
" Plugin 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" add this line to your .vimrc file
Plugin 'mattn/emmet-vim'

" https://github.com/ycm-core/YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" https://github.com/preservim/nerdtree
Plugin 'preservim/nerdtree'
"https://github.com/PhilRunninger/nerdtree-visual-selection
Plugin 'PhilRunninger/nerdtree-visual-selection'

" https://github.com/preservim/vim-markdown
Plugin 'godlygeek/tabular'
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
set signcolumn=no
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
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
inoremap <c-c> <esc>
" <leader><leader> is more convenient than <c-^>
nnoremap <leader><leader> <c-^>
" Align selected lines
vnoremap <leader>ib :!align<cr>
" Close all other splits
nnoremap <leader>o :only<cr>
"
nnoremap <leader>w :w<cr>
"
nnoremap <silent> vv <C-w>v

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

""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
let $FZF_DEFAULT_COMMAND = 'fd -I --type f --strip-cwd-prefix --hidden --follow'

map <leader>t :Files<cr>
map <leader>fv :Files vendor<cr>
map <leader>fm :Files vendor/magento<cr>
map <leader>fc :Files app/code<cr>
map <leader>mt :Files app/code/OSI/MapViewer/view/frontend/web/js<cr>

""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['sh', 'bash', 'scss', 'sass', 'html'] }

set mmp=8000

" Surround
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" Remove trailing whitespace https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Clip
" map mark to gm
nnoremap gm m

" emoji file types
au FileType html,php,markdown,mmd,text,mail,gitcommit runtime macros/emoji-ab.vim

function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
            \   'source':  reverse(<sid>buflist()),
            \   'sink':    function('<sid>bufopen'),
            \   'options': '+m',
            \   'down':    len(<sid>buflist()) + 4
            \ })<CR>

" Fugitive

nnoremap <leader>G :Git<cr>

" Ycm configuration

let g:ycm_language_server = [
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'php', '-d', 'memory_limt=4024M',  '/home/vladimir/dev/tools/phpactor/bin/phpactor', 'language-server' ],
  \     'filetypes': [ 'php' ],
  \   },
  \ ]

" toggle signature help in insert mode
imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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

" Ycm
nnoremap <silent> <leader>g :YcmCompleter GoToDefinition<CR>
nmap <silent> leader>d <plug>(YCMHover)
let g:ycm_auto_hover = ''
