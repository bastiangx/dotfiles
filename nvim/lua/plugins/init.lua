return {
  {
    -- NVCHAD Default plugins --

    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
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
          max_height = 12,
          max_width = 48,
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
          "init.py",
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
            height = 50,
            width = 62,
          },
        },
      },
    },
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
    event = "BufRead",
  },

  -- Leap dependency  - vim-repeat
  "tpope/vim-repeat",
  -- Leap / fast navigation
  {
    "ggandor/leap.nvim",
    depends = "tpope/vim-repeat",
    event = "BufRead",
  },

  -- copilot setup
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    opts = function()
      return require "configs.copilot"
    end,
    event = "BufRead",
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
    event = "BufRead *.rs",
    depends = "neovim/nvim-lspconfig",
  },

  -- rust crates setup
  {
    "saecki/crates.nvim",
    ft = { "toml", "rust" },
    event = { "BufRead" },
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
    event = "BufRead",
  },

  -- Renamer
  {
    "filipdutescu/renamer.nvim",
    depends = "nvim-lua/plenary.nvim",
    config = function()
      require "configs.renamer"
    end,
    event = "VeryLazy",
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
    event = "BufRead",
  },

  -- smooth cursor setup
  {
    "gen740/SmoothCursor.nvim",
    enabled = false,
    config = function()
      require "configs.smoothcursor"
    end,
    event = "BufRead",
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
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
