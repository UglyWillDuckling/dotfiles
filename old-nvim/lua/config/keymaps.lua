-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function map(mode, l, r, desc, options)
  options = options or {}

  options.desc = desc
  vim.keymap.set(mode, l, r, options)
end

local function delete(mode, l)
  vim.keymap.del(mode, l)
end

-- Previous File
keymap.set("n", "<M-i>", "<C-^>", opts)
-- leave only current window
keymap.set("n", "<leader>o", ":only<cr>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Fold set to numeric 1
keymap.set("n", "<S-u>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", opts)

-- Telescope
keymap.set(
  "n",
  "<leader>sp",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Previous Search" }
)
keymap.set(
  "n",
  "<leader>r",
  LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }),
  { noremap = true, silent = true, desc = "Recent Files" }
)

-- Replace Default window switching
keymap.set("n", "<C-j>", ":call WinMove('j')<CR>", opts)
keymap.set("n", "<C-h>", ":call WinMove('h')<CR>", opts)
keymap.set("n", "<C-k>", ":call WinMove('k')<CR>", opts)
keymap.set("n", "<C-l>", ":call WinMove('l')<CR>", opts)

local smartsplits = require("smart-splits")
keymap.set("n", "<Left>", smartsplits.resize_left)
keymap.set("n", "<Down>", smartsplits.resize_down)
keymap.set("n", "<Up>", smartsplits.resize_up)
keymap.set("n", "<Right>", smartsplits.resize_right)

-- Yanky -- https://github.com/gbprod/yanky.nvim
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
--
vim.keymap.set("n", "Y", "y$", opts)

-- Codeium https://github.com/Exafunction/codeium.vim
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

vim.keymap.set("n", "<C-q>", "<Cmd>call codeium#Clear()<CR>")
vim.keymap.set("i", "<C-q>", "<Cmd>call codeium#Clear()<CR>")
vim.keymap.set("i", "<C-u>", "<Cmd>call codeium#Clear()<CR>")
vim.keymap.set("i", "<M-[>", "<Plug>(codeium-previous)")
vim.keymap.set("i", "<M-]>", "<Plug>(codeium-next)")

vim.keymap.set("i", "<C-l>", function()
  return vim.fn["codeium#AcceptNextLine"]()
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-t>", function()
  return vim.fn["codeium#AcceptNextWord"]()
end, { expr = true, silent = true })

map("n", "leader>ai", ":CodeiumEnable<CR>", "Codeium Enable")
map("n", "<leader>ae", ":CodeiumEnable<CR>", "Codeium Enable")
map("n", "<leader>ad", ":CodeiumDisable<CR>", "Codeium Disable")

-- Git Signs
local gs = require("gitsigns")

map("n", "]c", function()
  gs.nav_hunk("next")
end, "Next")

map("n", "[c", function()
  gs.nav_hunk("prev")
end, "Prev")

-- vim-surround
delete("i", "<C-G>s")
delete("i", "<C-G>S")

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-t>", ":NvimTreeFocus<CR>", { silent = true, noremap = true })

-- Move
-- https://github.com/fedepujol/move.nvim
-- ../plugins/editor.lua
vim.keymap.set("n", "<S-Up>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":MoveLine(1)<CR>", opts)

vim.keymap.set("v", "<S-Up>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<S-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<S-Left>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<S-Right>", ":MoveHBlock(1)<CR>", opts)

-- phpactor
map("n", "<leader>ac", ":call ClassName()<cr>", "PHP Class Name via phpactor")

-- Markdown
map("n", "<leader>mt", ":RenderMarkdown toggle<CR>")

-- Obsidian
map("n", "<leader>moq", ":ObsidianQuickSwitch<CR>")

-- Run this file
map("n", "<M-e>", ":!./%<CR>", "", opts)
