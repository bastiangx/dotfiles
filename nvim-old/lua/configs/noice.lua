require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
    signature = {
      enabled = false,
      auto_open = {
        enabled = false,
      },
    },
    hover = {
      enabled = false,
      silent = true,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
    },
  },

  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },

  views = {
    mini = {
      timeout = 3000,
      style = "rounded",
      position = {
        row = 1,
      },
    },
  },

  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = false,      -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
})
