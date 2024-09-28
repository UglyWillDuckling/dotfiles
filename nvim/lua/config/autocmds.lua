-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("emoji"),
  pattern = {
    "typescript",
    "javascript",
    "rs",
    "ruby",
    "rb",
    "html",
    "php",
    "markdown",
    "mmd",
    "text",
    "mail",
    "gitcommit",
  },
  callback = function()
    vim.cmd("runtime macros/emoji-ab.vim")
  end,
})
