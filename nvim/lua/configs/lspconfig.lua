-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- python
lspconfig.basedpyright.setup {
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}
-- astro lsp
lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "astro" },
}

-- rust_analyzer setup
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust", "rs" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
}
-- golang
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  cmd = { "gopls" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
}

-- c/cpp clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

-- jsonlsp
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "json" },
}

-- tailwindcss lsp
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "astro", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

-- marskmanlsp for md
lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown", "mdx" },
}

-- html/html lsp
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}

lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "htmx" },
}

-- yaml lsp
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml" },
}
