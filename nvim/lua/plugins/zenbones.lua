---@diagnostic disable: undefined-global
return {
  "zenbones-theme/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  name = "rosebones",
  config = function()
    vim.cmd.colorscheme("rosebones")
    vim.g.rosebones_darken_comments = 55
    vim.g.rosebones_transparent_background = true
    vim.g.rosebones_darkness = "stark"
    vim.g.rosebones_solid_line_nr = false
    vim.g.rosebones_solid_float_border = false
  end,
}
