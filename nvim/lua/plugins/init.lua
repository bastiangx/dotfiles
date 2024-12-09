return {

    -----------------------
    -----------------------
    -----------------------
    ---  NVCHAD PLUGINS  --
    -----------------------
    -----------------------
    -----------------------

    --- file formatter: install via :Mason then add them in /configs/conform.lua
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    -- lsp: install via Mason then add them in /configs/lspconfig.lua
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- cmp: some custom opts
    {
        "hrsh7th/nvim-cmp",
        opts = {
            completion = {
                keyword_length = 2,
            },
            windows = {
                documentation = {
                    max_height = 20,
                    max_width = 32,
                },
            },
        },
    },

    -- nvim-tree: some custom opts
    {
        "kyazdani42/nvim-tree.lua",
        opts = {
            renderer = {
                special_files = {
                    "Cargo.toml",
                    "readme.md",
                    "package.json",
                    "README.md",
                },
            },
            filters = {
                dotfiles = false,
                custom = {
                    ".identifiers",
                },
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = {
                        relative = "editor",
                        anchor = "NE",
                        row = 4,
                        col = vim.o.columns + 40,
                        width = 44,
                        height = 35,
                    },
                },
            },
        },
    },

    -- `build` is disabled since it install all parsers on every update
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "configs.treesitter"
        end,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        -- build = ":TSUpdate",
    },

    -- planery: used as dependency for all plugins
    {
        "nvim-lua/plenary.nvim",
    },

    -- nvui: do not lazy load or delete
    {
        "nvchad/ui",
        config = function()
            require "nvchad"
        end,
    },

    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
    },

    -----------------------
    -----------------------
    -----------------------
    ---  CUSTOM PLUGINS  --
    -----------------------
    -----------------------
    -----------------------

    -- noice: notfis, central cmd, etc.
    {
        "folke/noice.nvim",
        depends = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require "configs.noice"
        end,
        lazy = false,
    },

    -- - vim-repeat: `Leap` dependency
    "tpope/vim-repeat",

    -- Leap: jump to any character in the buffer with 2 keystrokes
    {
        "ggandor/leap.nvim",
        depends = "tpope/vim-repeat",
        event = "VeryLazy",
    },

    -- copilot(non-official version): not recommended for daily use
    {
        "zbirenbaum/copilot.lua",
        opts = function()
            return require "configs.copilot"
        end,
        cmd = "Copilot",
        event = "VeryLazy",
    },

    -- arrow: Harpoon like bookmarks, highly recommended
    -- key to open: m
    {
        "otavioschwanck/arrow.nvim",
        opts = function()
            return require "configs.arrow"
        end,
        lazy = false,
    },

    -- oil: nvim's best text-based file explorer
    {
        "stevearc/oil.nvim",
        depends = "nvim-tree/nvim-web-devicons",
        config = function()
            require "configs.oil"
        end,
        lazy = false,
    },

    -- rust tools: analyzer, run, debug, etc.
    {
        "simrat39/rust-tools.nvim",
        opts = {
            tools = {
                max_len_align = true,
                max_len_align_padding = 2,
                hover_actions = {
                    auto_focus = true,
                },
            },
        },
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
        ft = "rust",
        event = "BufReadPost *.rs",
        depends = "neovim/nvim-lspconfig",
    },

    -- crates: show dependencies in Cargo.toml with version control
    {
        "saecki/crates.nvim",
        ft = { "toml" },
        event = { "BufReadPost Cargo.toml" },
        config = function()
            local crates = require "crates"
            crates.setup()
            crates.show()
        end,
    },

    -- Renamer: lsp based renamer using `<leader>ra`
    {
        "filipdutescu/renamer.nvim",
        depends = "nvim-lua/plenary.nvim",
        config = function()
            require "configs.renamer"
        end,
        event = "LspAttach",
    },

    -- Mini indentline: minimal indentline with scope
    {
        "echasnovski/mini.nvim",
        opts = {
            draw = {
                delay = 25,
            },
            symbol = "▏",
        },
        config = function(_, opts)
            require("mini.indentscope").setup(opts)
        end,
        event = "BufRead",
    },

    -- boo: LSP guide/help/docs popup using `<leader>lp`
    {
        "LukasPietzschmann/boo.nvim",
        config = function()
            require "configs.boo"
        end,
        event = "LspAttach",
    },

    -- coerce: word/textObject case switcher using `gc`
    { "gregorias/coop.nvim", event = "VeryLazy" },
    {
        "gregorias/coerce.nvim",
        config = function()
            require "configs.coerce"
        end,
        depends = { "folke/which-key.nvim", "gregorias/coop.nvim" },
        event = "VeryLazy",
    },

    -- no-neck-pain: center the buffer using `<leader>ne`
    {
        "shortcuts/no-neck-pain.nvim",
        config = function()
            require "configs.no-neck-pain"
        end,
        event = "VeryLazy",
    },

    -- snacks by folke - bundled quality of life improvements
    -- chnages notifs, bigfiles, lazygit, styles, windows, words, etc.
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            notifier = { enabled = true, timeout = 4000 },
            words = { enabled = true },
            debug = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true },
                },
            },
        },
    },

    -- troueble: lsp diagnostics, references, etc.
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>dt",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>dT",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>dr",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>dR",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>dq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- wilder.nvim: better command-line history
    {
        "gelguy/wilder.nvim",
        opts = {
            modes = { ":", "/", "?" },
        },
        config = function(_, opts)
            require("wilder").setup(opts)
        end,
        event = "CmdlineEnter",
    },

    --- Disabled PLUGINS ---
    { "NvChad/nvim-colorizer.lua", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
