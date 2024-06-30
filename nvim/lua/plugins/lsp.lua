return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cpptools",
        "codelldb",
        "luacheck",
        "shellcheck",
        "shfmt",
        "phpactor",
        "psalm",
        "easy-coding-standard",
        "markdownlint",
        "marksman",
      })
    end,
  },
}
