-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local servers = {
    "html",
    "cssls",
    -- "gopls",
    -- "lua_lsp",
    -- "rust_analyzer",
    -- "ruff_lsp",
    -- "basedpyright",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

--
--
-- OLDER CONF

-- -- python
lspconfig.ruff_lsp.setup {
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
}
--
lspconfig.basedpyright.setup {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" },
            },
        },
    },
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
}
-- -- Kotlin
lspconfig.kotlin_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "kotlin" },
    root_dir = lspconfig.util.root_pattern("build.gradle.kts", "settings.gradle.kts", "gradlew", "pom.xml"),
}
--
-- -- rust_analyzer setup
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

-- yaml lsp
lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "yaml" },
}
