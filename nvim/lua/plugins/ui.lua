return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<S-l>", false },
      { "<S-h>", false },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      █████╗ ██████╗  ██████╗██╗  ██╗██╗   ██╗
      ██╔══██╗██╔══██╗██╔════╝██║  ██║╚██╗ ██╔╝
      ███████║██████╔╝██║     ███████║ ╚████╔╝ 
      ██╔══██║██╔══██╗██║     ██╔══██║  ╚██╔╝  
      ██║  ██║██║  ██║╚██████╗██║  ██║   ██║   
      ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   
                                         
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
