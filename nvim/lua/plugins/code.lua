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
}
