require "nvchad.options"

local opt = vim.opt

-- relative numbers always on
opt.relativenumber = true
opt.wrap = false

-- limit cmp/suggestions to 12
opt.pumheight = 20

-- for obsidian ui being shown
opt.conceallevel = 0

-- local o = vim.o

-- o.cu
