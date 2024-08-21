return {
  -- NVCHAD Default plugins --
  {
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

  -- ts: markdwon override for obsidian
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
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
    event = "LspAttach",
  },

  -- center the buffer
  {
    "shortcuts/no-neck-pain.nvim",
    config = function()
      require "configs.no-neck-pain"
    end,
    event = { "BufReadPost", "BufNewFile" },
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

  -- markview -> obsidian companion for previewing md files

  {
    "OXY2DEV/markview.nvim",
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "epwalsh/obsidian.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "md", "markdown" },
    event = "BufReadPost *.md",
    cmd = "Markview",
    config = function()
      require "configs.markview"
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
}
