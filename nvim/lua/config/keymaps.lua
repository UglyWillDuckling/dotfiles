-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additionol keymaps here

-- Disable continuations
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.del("n", "<S-l>")
keymap.del("n", "<S-h>")
keymap.set("n", "<M-,>", "<C-^>", opts)
keymap.set("n", "<leader>o", ":only<cr>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Fold
keymap.set("n", "<c-space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", opts)

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
  require("telescope.builtin").oldfiles,
  { noremap = true, silent = true, desc = "Recent Files" }
)

-- Disable Default window switching
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

-- Codeium
vim.keymap.set("n", "<C-q>", "<Cmd>call codeium#Clear()<CR>")
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
