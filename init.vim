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
" nnoremap <silent> <M-m> :NvimTreeFocus<CR>
nnoremap <silent> <M-f> :NvimTreeFindFile<CR>
nnoremap <silent> <M-,> :NvimTreeToggle<CR>
" nnoremap <silent> <leader>t :NvimTreeToggle<CR>

" COC
inoremap <silent><expr> <C-d> coc#pum#visible() ? coc#pum#confirm() : "\<C-d>"
inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
nnoremap <silent> <leader>ch :call CocAction('doHover')<CR>
nnoremap <silent> <leader>cs <Plug>(coc-codeaction-source)
nnoremap <silent> <leader>cr <Plug>(coc-codeaction-refactor)
nnoremap <silent> <leader>cc <Plug>(coc-codeaction-cursor)

nnoremap <silent> <leader>ca <Plug>(coc-codeaction)

" code navigation
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
----------------------------------------
-- Nvim-tree
----------------------------------------
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local treeutils = require('treeutils')

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
    vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
    vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
    vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
    vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
    vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
    vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
    vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set('n', '<C-w>',     api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
    vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
    vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set('n', '<leader>h',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
    -- vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
    vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
    vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
    vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
    vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
    -- END_DEFAULT_ON_ATTACH

    -- custom mappings
    vim.keymap.set('n', '<C-f>', treeutils.launch_find_files)
    vim.keymap.set('n', '<leader><C-g>', treeutils.launch_live_grep)
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
-- test
    vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Tab drop"))
end

require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    ---
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
}
EOF
