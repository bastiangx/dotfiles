return {
    -- NVCHAD Default plugins --
    {
        "stevearc/conform.nvim",
        config = function()
            require "configs.conform"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- cmp options overriding nvchad default
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
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
                { name = "rg" },
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

    -- startup - spcaeport for project finding
    {
        "CWood-sdf/spaceport.nvim",
        opts = function()
            require "configs.spaceport"
        end,
        cmd = "Spaceport",
        lazy = false,
    },

    -- obsidian.nvim seup
    {
        "epwalsh/obsidian.nvim",
        depends = "nvim-lua/plenary.nvim",
        ft = { "md", "markdown" },
        event = "BufReadPost *.md",
        config = function()
            require "configs.obsidian"
        end,
    },

    {
        -- cmp -rg: ripgrep source for nvim-cmp
        "lukas-reineke/cmp-rg",
        depends = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },

    --- Disabled PLUGINS ---
    { "NvChad/nvim-colorizer.lua", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },

    -- These are some examples, uncomment them if you want to see them work!
    --
    -- {
    -- 	"williamboman/mason.nvim",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"lua-language-server", "stylua",
    -- 			"html-lsp", "css-lsp" , "prettier"
    -- 		},
    -- 	},
    -- },
    --
}
