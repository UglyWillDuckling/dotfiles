-- add more treesitter parsers
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "kdl",
        "gitignore",
        "cmake",
        "php",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "scss",
        "sql",
        "http",
        "java",
      },
      incremental_selection = {
        keymaps = {
          init_selection = "<M-l>",
          node_incremental = "<M-l>",
          scope_incremental = false,
          node_decremental = "<M-,>",
        },
      },
      textobjects = {
        move = {
          enable = false,
        },
      },
    },
  },
}
