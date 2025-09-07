return {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  name = "poimandres",
  priority = 1000,
  options = {
    overrides = function(colors) -- add/modify highlights
      return {
        CursorLine = { bg = "none" },
        LineNr = { bg = "none" },
        Boolean = { italic = true },
        StatusLine = { bg = "none" },
      }
    end,
  },
  config = function()
    require("poimandres").setup({
      bold_vert_split = false, -- use bold vertical separators
      dim_nc_background = false, -- dim 'non-current' window backgrounds
      disable_background = true, -- disable background
      disable_float_background = false, -- disable background for floats
      disable_italics = false, -- disable italics
    })
  end,

  init = function()
    vim.cmd("colorscheme poimandres")
  end,
}
