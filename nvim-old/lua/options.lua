require "nvchad.options"

local opt = vim.opt
-- relative numbers always on
opt.relativenumber = true
opt.wrap = false

-- limit cmp/suggestions to 12
opt.pumheight = 20

-- for obsidian ui being shown
opt.conceallevel = 0

-- clipboard
opt.clipboard = "unnamedplus"

-- indent
opt.tabstop = 2
opt.shiftwidth = 2

-- test - disappear statusbar
opt.laststatus = 0
opt.cmdheight = 0
opt.showmode = false
opt.ruler = false
