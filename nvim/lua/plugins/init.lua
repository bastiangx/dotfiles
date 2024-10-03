return {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

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


    -- nvim-tree: some custom options
    {
        "kyazdani42/nvim-tree.lua",
        opts = {
            renderer = {
                special_files = {
                    "Cargo.toml",
                    "main.rs",
                    "app.rs",
                    "init.rs",
                    "init.py",
                    "init.lua",
                    "app.py",
                    "main.py",
                    "readme.md",
                    "README.md",
                },
            },
            filters = {
                dotfiles = false,
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = {
                        width = 48,
                        height = 28,
                    },
                },
            },
        },
    },

    -- has custom list of langs to install
    -- default opts from nvchad
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "configs.treesitter"
        end,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
    },

    -- planery
    {
        "nvim-lua/plenary.nvim",
    },
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

    -- CUSTOM PLUGINS --

    -- noice setup
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

    -- Leap dependency  - vim-repeat
    "tpope/vim-repeat",
    -- Leap / fast navigation
    {
        "ggandor/leap.nvim",
        depends = "tpope/vim-repeat",
        event = "VeryLazy",
    },

    -- copilot setup
    {
        "zbirenbaum/copilot.lua",
        opts = function()
            return require "configs.copilot"
        end,
        cmd = "Copilot",
        event = "VeryLazy",
    },

    -- arrow.nvim setup
    {
        "otavioschwanck/arrow.nvim",
        opts = function()
            return require "configs.arrow"
        end,
        lazy = false,
    },

    -- oil.nvim setup
    {
        "stevearc/oil.nvim",
        depends = "nvim-tree/nvim-web-devicons",
        config = function()
            require "configs.oil"
        end,
        lazy = false,
    },

    -- java lsp setup
    {
        "nvim-java/nvim-java",
        config = function()
            require("nvim-java").setup()
        end,
        ft = "java",
    },

    -- rust tools setup
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

    -- rust crates setup
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

    -- todo comments, highlights and icons
    {
        "folke/todo-comments.nvim",
        depends = "nvim-lua/plenary.nvim",
        opts = function()
            return require "configs.comments"
        end,
        event = "BufReadPost",
    },

    -- Renamer
    {
        "filipdutescu/renamer.nvim",
        depends = "nvim-lua/plenary.nvim",
        config = function()
            require "configs.renamer"
        end,
        event = "LspAttach",
    },

    -- Mini indentline
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

    -- LSP guide/help/docs popup
    {
        "LukasPietzschmann/boo.nvim",
        config = function()
            require "configs.boo"
        end,
        event = "LspAttach",
    },

    -- word/textObject case switcher
    {
        "gregorias/coerce.nvim",
        config = function()
            require "configs.coerce"
        end,
        depends = "folke/which-key.nvim",
        event = "VeryLazy",
    },

    -- center the buffer
    {
        "shortcuts/no-neck-pain.nvim",
        config = function()
            require "configs.no-neck-pain"
        end,
        event = "VeryLazy",
    },

    -- obsidian.nvim seup
    {
        "epwalsh/obsidian.nvim",
        enabled = false,
        depends = "nvim-lua/plenary.nvim",
        ft = { "md", "markdown" },
        event = "BufReadPost *.md",
        config = function()
            require "configs.obsidian"
        end,
    },

    --- Disabled PLUGINS ---
    { "NvChad/nvim-colorizer.lua", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
