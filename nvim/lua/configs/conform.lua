local options = {
    lsp_fallback = true,

    formatters_by_ft = {

        lua = { "stylua" },
        markdown = { "prettier" },
        json = { "prettier", "fixjson" },
        yaml = { "prettier", "yamlfix" },

        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "blue" },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        rust = { "rustfmt" },
        asm = { "asmfmt" },

        go = {
            "gofumpt",
            "golines",
            "goimports",
            "goimports-reviser",
        },

        c = { "clang-format" },
        cpp = { "clang-format" },

        sh = { "shfmt" },
    },

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

require("conform").setup(options)
