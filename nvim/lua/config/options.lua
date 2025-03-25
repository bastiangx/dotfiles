local go = vim.g
local o = vim.opt

-- Optimizations on startup
vim.loader.enable()

-- Personal Config and LazyVim global options
go.lualine_info_extras = false
go.codeium_cmp_hide = true
go.lazygit_config = false

-- Define leader key
go.mapleader = " "
go.maplocalleader = "\\"

-- Autoformat on save (Global)
go.autoformat = true

-- Clipboard settings
o.clipboard = "unnamedplus" -- use system clipboard
o.fixeol = true -- fix line endings

-- More intuitive splits
o.splitright = true -- put new windows right of current
o.splitbelow = true -- put new windows below current

-- Cursorline
o.cursorline = false

-- Font
go.gui_font_default_size = 12
go.gui_font_size = go.gui_font_default_size

-- Enable EditorConfig integration
go.editorconfig = true

-- Root dir detection
-- cwd has priority over lsp
go.root_spec = {
  "cwd",
  "lsp",
  { ".git", "lib", "lua", ".obsidian", "package.json", "Makefile", "go.mod", "cargo.toml", "pyproject.toml", "src" },
}

-- Disable annoying cmd line stuff
o.showcmd = false
o.laststatus = 3
o.cmdheight = 0

-- Enable spell checking
o.spell = false
-- o.spelllang:append("es")

-- Backspacing and indentation when wrapping
o.backspace = { "start", "eol", "indent" }
o.breakindent = true

-- Smoothscroll
-- if vim.fn.has("nvim-0.10") == 1 then
--   o.smoothscroll = true
-- end

o.conceallevel = 0
