-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.list = false -- Hide special chars

-- CHADtree
-- https://github.com/ms-jpq/chadtree/blob/chad/docs/CONFIGURATION.md
-- https://github.com/ms-jpq/chadtree/blob/chad/docs/THEME.md
local chadtree_settings = {
  ["theme.text_colour_set"] = "solarized_dark_256",
  ["keymap.primary"] = { "o" },
  ["keymap.secondary"] = { "<space>" },
  ["view.width"] = 40,
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

vim.g["lsp-defaults-disable"] = 1
vim.g.codeium_disable_bindings = 1
