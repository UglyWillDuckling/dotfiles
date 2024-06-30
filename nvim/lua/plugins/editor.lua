return {
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "folke/noice.nvim",
    keys = {
      { "<c-f>", false },
      { "<c-F>", false },
      { "<c-b>", false },
    },
  },
  {
    -- https://github.com/folke/flash.nvim
    "folke/flash.nvim",
    opts = {
      continue = false,
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
  -- vim-rsi
  -- https://github.com/tpope/vim-rsi
  {
    "tpope/vim-rsi",
    lazy = true,
    event = "VeryLazy",
  },
}
