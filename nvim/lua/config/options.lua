-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- UI
vim.opt.wrap = true
vim.opt.cursorline = false

-- Tabs & Indentation
vim.g.autoformat = false

-- LSP
vim.lsp.enable("sourcekit")
vim.opt.spell = false
