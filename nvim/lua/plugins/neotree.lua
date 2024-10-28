return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
  {
    "PhilRunninger/nerdtree-visual-selection",
    event = "VeryLazy",
  },
  {
    "scrooloose/nerdtree",
    event = "VeryLazy",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      window = {
        mappings = {
          ["l"] = "open",
          ["o"] = "open",
          ["h"] = "close_node",
          ["/"] = "none",
          ["f"] = "none",
          ["w"] = "none",
          ["<c-/>"] = "fuzzy_finder",
          ["<c-f>"] = "filter_on_submit",
        },
      },
    },
  },
}
