return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<a-p>", false }
      keys[#keys + 1] = { "<a-n>", false }
      keys[#keys + 1] = { "<C-K>", false }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cpptools",
        "codelldb",
        "luacheck",
        "shellcheck",
        "shfmt",
        "psalm",
        "easy-coding-standard",
        "markdownlint",
        "marksman",
      })
    end,
  },
}
