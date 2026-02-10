---@diagnostic disable: undefined-global
return {
  "datsfilipe/vesper.nvim",
  enabled = false,
  name = "vesper",
  lazy = false,
  priority = 1000,
  config = function()
    -- Color definitions for dark and light modes
    local highlights = {
      dark = {
        -- String = "#b4befe",
        -- StringDelimiter = "#b4befe",
        -- StringEscape = "#b4befe",
        -- StringSpecial = "#94e2d5",
        Comment = "#575279",
      },
      light = {
        -- String = "#56949f",
        -- StringDelimiter = "#56949f",
        -- StringEscape = "#56949f",
        -- StringSpecial = "#56949f",
        Comment = "#797593",
      },
    }

    require("vesper").setup({
      transparent = true,
      italics = {
        comments = true,
      },
      overrides = function()
        local is_light = vim.o.background == "light"
        local colors = is_light and highlights.light or highlights.dark

        return {
          String = { fg = colors.String },
          StringDelimiter = { fg = colors.StringDelimiter },
          StringEscape = { fg = colors.StringEscape },
          StringSpecial = { fg = colors.StringSpecial },
          Comment = { italic = true, fg = colors.Comment },
        }
      end,
    })

    vim.cmd.colorscheme("vesper")
  end,
}
