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
    local function apply_custom_highlights()
      vim.schedule(function()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, "String", { fg = "#179299" })
        set_hl(0, "StringDelimiter", { fg = "#179299" })
        set_hl(0, "StringEscape", { fg = "#179299" })
        set_hl(0, "StringSpecial", { fg = "#179299" })
        set_hl(0, "Comment", { italic = true })
      end)
    end

    local group = vim.api.nvim_create_augroup("RosePineCustomHighlights", { clear = true })
    vim.api.nvim_create_autocmd(
      { "ColorScheme", "BufWinEnter", "WinEnter", "UIEnter", "LspAttach", "BufEnter", "FileType" },
      {
        group = group,
        pattern = "*",
        callback = function()
          vim.defer_fn(apply_custom_highlights, 50)
        end,
      }
    )
    vim.cmd("colorscheme rose-pine")
    apply_custom_highlights()
  end,
}
