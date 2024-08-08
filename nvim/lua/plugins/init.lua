return {
  {
    -- NVCHAD Default plugins --

    "stevearc/conform.nvim",
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
    event = "InsertEnter",
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
    event = "BufReadPost",
  },

  -- Leap dependency  - vim-repeat
  "tpope/vim-repeat",
  -- Leap / fast navigation
  {
    "ggandor/leap.nvim",
    depends = "tpope/vim-repeat",
    event = "BufReadPost",
  },

  -- copilot setup
  {
    "zbirenbaum/copilot.lua",
    opts = function()
      return require "configs.copilot"
    end,
    cmd = "Copilot",
    -- cond: exclude filetypes from main coding langs like rs, py, java, etc
    cond = function()
      local excluded_ft = {
        "rust",
        "python",
        "java",
        "c",
        "go",
        "cpp",
        "zig",
        "oil",
        "NvimTree",
        "lspinfo",
        "Oil",
        "help",
      }
      local ft = vim.bo.filetype
      for _, v in ipairs(excluded_ft) do
        if ft == v then
          return false
        end
      end
      return true
    end,
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
    event = "LspAttach",
  },

  --- Disabled PLUGINS ---
  { "NvChad/nvim-colorizer.lua", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "gen740/SmoothCursor.nvim", enabled = false },

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
