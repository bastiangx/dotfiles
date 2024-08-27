-- pcall(function()
--   dofile(vim.g.base46_cache .. "syntax")
--   dofile(vim.g.base46_cache .. "treesitter")
-- end)

local options = {
  -- ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
  ensure_installed = {
    "luadoc",
    "printf",
    "vim",
    "vimdoc",
    "nix",
    "python",
    "java",
    "javascript",
    "typescript",
    "lua",
    "rust",
    "go",
    "ruby",
    "php",
    "c",
    "cpp",
    "csharp",
    "bash",
    "html",
    "css",
    "json",
    "yaml",
    "toml",
    "markdown",
    "norg",
    "org",
    "latex",
    "rst",
    "assembly",
    "nasm",
    "llvm",
    "verilog",
    "odin",
    "elixir",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
-- return options
