---@diagnostic disable: undefined-global
return {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  name = "poimandres",
  priority = 1000,
  config = function()
    local function apply_custom_highlights()
      vim.schedule(function()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, 'CursorLine', { bg = 'NONE' })
        set_hl(0, 'LineNr', { bg = 'NONE' })
        set_hl(0, 'Boolean', { italic = true })
        set_hl(0, 'StatusLine', { bg = 'NONE' })
        set_hl(0, 'WinSeparator', { bg = 'NONE', fg = '#2a283e' })
        set_hl(0, 'Comment', { italic = true })
      end)
    end

    require("poimandres").setup({
      bold_vert_split = false,          -- use bold vertical separators
      dim_nc_background = false,        -- dim 'non-current' window backgrounds
      disable_background = true,        -- disable background
      disable_float_background = false, -- disable background for floats
      disable_italics = false,          -- disable italics
    })

    local group = vim.api.nvim_create_augroup('PoimandresCustomHighlights', { clear = true })
    vim.api.nvim_create_autocmd(
    { 'ColorScheme', 'BufWinEnter', 'WinEnter', 'UIEnter', 'LspAttach', 'BufEnter', 'FileType' }, {
      group = group,
      pattern = '*',
      callback = function()
        vim.defer_fn(apply_custom_highlights, 50)
      end,
    })
    vim.cmd("colorscheme poimandres")
    apply_custom_highlights()
  end,
}
