return {
  {
    "mattn/emmet-vim",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.g.user_emmet_mode = "in"
    end,
  },
}
