return {
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    -- !!! opts is required
    opts = {
      char = {
        enable = true,
      },
    },
  },
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
  -- https://github.com/tpope/vim-rsi
  {
    "tpope/vim-rsi",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    lazy = true,
    event = "VeryLazy",
  },
  -- https://github.com/junegunn/vim-easy-align
  {
    "junegunn/vim-easy-align",
    lazy = true,
    event = "VeryLazy",
  },
}
