---@diagnostic disable: undefined-global
return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  opts = {
    styles = {
      transparency = true,
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)

    -- Color definitions for dark and light modes
    local highlights = {
      dark = {
        String = "#94e2d5",
        StringDelimiter = "#94e2d5",
        StringEscape = "#94e2d5",
        StringSpecial = "#94e2d5",
        Comment = "#575279",
      },
      light = {
        String = "#56949f",
        StringDelimiter = "#56949f",
        StringEscape = "#56949f",
        StringSpecial = "#56949f",
        Comment = "#797593",
      },
    }

    local function apply_custom_highlights()
      vim.schedule(function()
        local set_hl = vim.api.nvim_set_hl
        local is_light = vim.o.background == "light"
        local colors = is_light and highlights.light or highlights.dark

        set_hl(0, "String", { fg = colors.String })
        set_hl(0, "StringDelimiter", { fg = colors.StringDelimiter })
        set_hl(0, "StringEscape", { fg = colors.StringEscape })
        set_hl(0, "StringSpecial", { fg = colors.StringSpecial })
        set_hl(0, "Comment", { italic = true, fg = colors.Comment })
      end)
    end

    local group = vim.api.nvim_create_augroup("RosePineCustomHighlights", { clear = true })
    vim.api.nvim_create_autocmd(
      { "ColorScheme", "BufWinEnter", "WinEnter", "UIEnter", "LspAttach", "BufEnter", "FileType", "OptionSet" },
      {
        group = group,
        pattern = "*",
        callback = function(ev)
          if ev.event == "OptionSet" and ev.match ~= "background" then
            return
          end
          vim.defer_fn(apply_custom_highlights, 50)
        end,
      }
    )
    vim.cmd("colorscheme rose-pine")
    apply_custom_highlights()
  end,
}
