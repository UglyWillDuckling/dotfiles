return {
  {
    "ms-jpq/chadtree",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<leader>z", ":CHADopen<CR>", mode = { "n" }, silent = true, { noremap = true } },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
  },
  -- {
  --   "https://github.com/fresh2dev/zellij.vim.git",
  --   lazy = false,
  --   keys = {
  --     { "<M-h>", ":ZellijNavigateLeft<CR>", mode = { "n", "i" }, silent = true, { silent = true, noremap = true } },
  --     { "<M-j>", ":ZellijNavigateDown<CR>", mode = { "n", "i" }, silent = true, { noremap = true } },
  --     { "<M-k>", ":ZellijNavigateUp<CR>", mode = { "n", "i" }, silent = true, { noremap = true } },
  --     { "<M-l>", ":ZellijNavigateRight<CR>", mode = { "n", "i" }, silent = true, { noremap = true } },
  --   },
  -- },
}
