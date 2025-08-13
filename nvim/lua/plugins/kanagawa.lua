return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  name = "kanagawa",
  opts = {
    -- Default options:
    compile = true, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {},
      },
    },
    overrides = function(colors) -- add/modify highlights
      return {
        CursorLine = { bg = "none" },
        LineNr = { bg = "none" },
        Boolean = { italic = true },
        StatusLine = { bg = "none" },
      }
    end,
    theme = "dragon", -- Load "wave" theme
    background = { -- map the value of 'background' option to a theme
      dark = "dragon", -- try "dragon" !
      light = "lotus",
    },
  },
}
