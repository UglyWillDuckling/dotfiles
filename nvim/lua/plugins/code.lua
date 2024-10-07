return {
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
}
