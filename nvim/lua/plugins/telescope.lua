local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

return {
  "telescope.nvim",
  opts = {
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-d>"] = actions.delete_buffer, -- + actions.move_to_top,
            ["<M-p>"] = action_layout.toggle_preview,
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fa",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = true,
          hidden = false,
        })
      end,
    },
  },
}
