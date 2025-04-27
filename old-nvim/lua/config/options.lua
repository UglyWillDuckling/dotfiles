-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.list = false -- Hide special chars

vim.g.mapleader = ","
vim.g["lsp-defaults-disable"] = 1
vim.g.codeium_disable_bindings = 1
