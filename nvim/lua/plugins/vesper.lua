---@diagnostic disable: undefined-global
return {
  "nexxeln/vesper.nvim",
  name = "vesper",
  lazy = false,
  priority = 1000,
  config = function()
    require("vesper").setup({
      transparent = true,
    })
    vim.cmd.colorscheme("vesper")
  end,
}
