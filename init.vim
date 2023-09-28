set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set termguicolors
nnoremap <silent> <BS> <c-w>h

" ------------------NVIM CONFIG------------------

Plugin 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plugin 'ray-x/sad.nvim'
" https://github.com/tversteeg/registers.nvim
Plugin 'tversteeg/registers.nvim'

" https://github.com/seandewar/killersheep.nvim
Plugin 'seandewar/killersheep.nvim'

" https://github.com/ggandor/leap.nvim
Plugin 'ggandor/leap.nvim'
" https://github.com/ggandor/flit.nvim
Plugin 'ggandor/flit.nvim'

" https://github.com/chentoast/marks.nvim
Plugin 'chentoast/marks.nvim'
" https://github.com/euclidianAce/BetterLua.vim
Plugin 'euclidianAce/BetterLua.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'nvim-tree/nvim-tree.lua'
Plugin 'nvim-tree/nvim-web-devicons'
" TODO check out the diff plugin
" Plugin 'sindrets/diffview.nvim'
Plugin 'phaazon/hop.nvim'
Plugin 'nvim-lualine/lualine.nvim'
" https://github.com/neoclide/coc.nvim
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" https://github.com/norcalli/nvim-colorizer.lua
Plugin 'norcalli/nvim-colorizer.lua'
" https://github.com/mrjones2014/smart-splits.nvim
Plugin 'mrjones2014/smart-splits.nvim'
" https://github.com/rhysd/vim-fixjson
Plugin 'rhysd/vim-fixjson'

" https://github.com/karb94/neoscroll.nvim
Plugin 'karb94/neoscroll.nvim'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set fillchars+=diff:╱
autocmd BufReadPost,FileReadPost * normal zR

" easily reload the .rc file
noremap <F1> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p> <cmd>Telescope registers<cr>

" nnoremap s :HopWord<CR>
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

" Tree
nnoremap <M-m> :NvimTreeFocus<CR>
nnoremap <M-f> :NvimTreeFindFile<CR>
nnoremap <M-,> :NvimTreeToggle<CR>
nnoremap <leader>t :NvimTreeToggle<CR>

" GoTo code navigation - COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying refactor code actions
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <F2> :call CocAction('diagnosticToggleBuffer')<cr>

lua << EOF
local api = vim.api
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.opt.winwidth = 40
vim.opt.fillchars:append { diff = "╱" }

vim.keymap.set('n', '<Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<Right>', require('smart-splits').resize_right)

require('neoscroll').setup({})
require'colorizer'.setup()
require'hop'.setup()
require('lualine').setup()
require("registers").setup({ show_empty = true, })
require'marks'.setup {}
require('smart-splits').setup({})

-- TREE API
-- local treeapi = require('nvim-tree.api')
-- local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- end

-- vim.keymap.set('n', '<C-]>', treeapi.tree.change_root_to_node,          opts('CD'))
-- vim.keymap.set('n', '<C-e>', treeapi.node.open.replace_tree_buffer,     opts('Open: In Place'))
require('leap').add_default_mappings()
require('leap').setup {
    labeled_modes = "vno",
}
require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T', },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "vno",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    opts = {}
}

require'sad'.setup({
  debug = false,
  exact = true,
  vsplit = false, -- split sad window the screen vertically, when set to number
  -- it is a threadhold when window is larger than the threshold sad will split vertically,
  height_ratio = 0.6, -- height ratio of sad window when split horizontally
  width_ratio = 0.6, -- height ratio of sad window when split vertically
})

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
-- require("true-zen").setup()

local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
require("telescope").setup {
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--no-ignore-vcs" },
            mappings = {
                i = {
                    ["<M-p>"] = action_layout.toggle_preview
                }
            }
        },
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer, -- + actions.move_to_top,
                    ["<M-p>"] = action_layout.toggle_preview
                }
            }
        }
    }
}

local treeutils = require('treeutils')
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    live_filter = {
        prefix = "[FILTER]: ",
    },
    view = {
        mappings = {
            list = {
                { key = "<leader>f", action_cb = treeutils.launch_find_files},
                { key = "<leader>g", action_cb = treeutils.launch_live_grep},
                { key = "h", action = "close_node" },
                { key = "gh", action = "tree.toggle_hidden_filter" }
            }
        }
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        custom = { "^.git$" }
    },
    git = {
        enable = true,
        ignore = false,
    },
    modified = {
        enable = true,
        show_on_dirs = false
    },
     actions = {
        open_file = {
          resize_window = false,
        }
    }
})
EOF
