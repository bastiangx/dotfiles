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
--
-- -- golang
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
--
-- -- java/jdtls options
local jdtls_path = vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls"
lspconfig.jdtls.setup {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",
        "-configuration",
        jdtls_path .. "/config_linux",
        "-data",
        vim.fn.expand "~/.cache/jdtls-workspace",
    },
    root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", ".gitignore"),
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "java" },
}
