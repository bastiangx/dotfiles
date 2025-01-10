return {
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      leader_key = "m",
      show_icons = true,
      separate_by_branch = true,
      save_key = "git_root", -- what will be used as root to save the bookmarks. Can be also `git_root`.
      hide_handbook = false, -- set to true to hide the shortcuts on menu.

      window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
        relative = "editor",
        width = "auto",
        height = "auto",
        row = "auto",
        col = "auto",
        title = "Arrow",
        border = "rounded",
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>m", function() require("arrow.ui").openMenu() end, desc = "Marks" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, require("arrow.statusline").text_for_statusline_with_icons())
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      -- stylua: ignore
      local button = dashboard.button("m", "󰛢 " .. " Marks", function() require("arrow.ui").openMenu() end)
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      -- stylua: ignore
      local arrow = {
        action = function() require("arrow.ui").openMenu() end,
        desc = " Marks",
        icon = "󰛢 ",
        key = "m",
      }

      arrow.desc = arrow.desc .. string.rep(" ", 43 - #arrow.desc)
      arrow.key_format = "  %s"

      table.insert(opts.config.center, 5, arrow)
    end,
  },
}
