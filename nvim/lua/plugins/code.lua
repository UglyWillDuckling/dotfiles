return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "liouk/gitlinks.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinks").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = true,
    event = "BufEnter",
  },
  {
    "glts/vim-textobj-comment",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "kana/vim-textobj-user",
    },
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "sigmasd/deno-nvim",
  },
}
