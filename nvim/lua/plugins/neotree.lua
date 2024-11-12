return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local treeutils = require("treeutils")
        local navigate = require("left-right")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- this will setup the default mappings
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

        vim.keymap.set("n", "<C-f>", treeutils.launch_find_files, opts("Launch Find Files"))
        vim.keymap.set("n", "<C-g>", treeutils.launch_live_grep, opts("Launch Live Grep"))

        vim.keymap.set("n", "h", navigate.left, opts("Navigate Left"))
        vim.keymap.set("n", "l", navigate.right, opts("Navigate Right"))
      end

      require("nvim-tree").setup({
        on_attach = on_attach,
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 40,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
  {
    "scrooloose/nerdtree",
    event = "VeryLazy",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
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
