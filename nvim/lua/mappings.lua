require "nvchad.mappings"
local wk = require "which-key"
local native = vim.keymap.set

native("n", ";", ":", { desc = "command mode" })

wk.add {
  -- NVIM MAPPINGS
  {
    group = "NVIM",
    icon = "",
    {
      "<leader>cl",
      function()
        vim.cmd "set fo-=c fo-=r fo-=o"
      end,
      desc = "Comment format override",
      icon = "",
    },
    {
      "<leader>cr",
      function()
        vim.cmd "set fo+=c fo+=r fo+=o"
      end,
      desc = "Comments format default",
      icon = "",
    },
    { "<A-.>", "<C-w><", desc = "Decrease width", icon = "" },
    { "<A-,>", "<C-w>>", desc = "Increase width", icon = "" },
    { "<A-k>", "<C-w>-", desc = "Decrease height", icon = "" },
    { "<A-j>", "<C-w>+", desc = "Increase height", icon = "" },
    { "<C-u>", "<C-u>zz", desc = "Scroll up", icon = "" },
    { "<C-d>", "<C-d>zz", desc = "Scroll down", icon = "" },
    { "<C-b>", "<C-b>zz", desc = "Scroll back", icon = "" },
    { "<C-f>", "<C-f>zz", desc = "Scroll forward", icon = "" },
    { "<leader>Q", ":qa<CR>", desc = "Quit NVIM", icon = "" },
  },

  -- Visual mode mappings
  {
    mode = "v",
    group = "Visual Mode",
    icon = "",
    { "<", "<gv", desc = "Indent left", icon = "" },
    { ">", ">gv", desc = "Indent right", icon = "" },
    { "<leader>y", '"+y', desc = "Copy to clipboard", icon = "" },
  },

  -- LSP GENERIC MAPPINGS
  {
    group = "LSP",
    icon = "",
    { "<leader>li", ":LspInfo<CR>", desc = "LSP Info", icon = "󱁯" },
    { "<leader>lQ", ":LspStop<CR>", desc = "LSP Stop (Not Recommended)", icon = "" },
    { "<leader>lq", ":LspStop ", desc = "LSP Stop server <x>", icon = "" },
    { "<leader>lR", ":LspRestart<CR>", desc = "LSP Restart", icon = "" },
    { "<leader>lr", ":LspRestart ", desc = "LSP Restart <x>", icon = "" },
    {
      "<leader>rh",
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      desc = "Rust Hover",
      icon = "",
    },
    {
      "<leader>rg",
      function()
        require("rust-tools").code_action_group.code_action_group()
      end,
      desc = "Rust Actions",
      icon = "",
    },
  },

  -- NVCHAD MAPPINGS
  {
    group = "NVChad",
    icon = "",
    {
      "<leader>tt",
      function()
        require("base46").toggle_transparency()
      end,
      desc = "Toggle Transparency",
      icon = "",
    },
    {
      "<leader>tn",
      function()
        require("base46").toggle_theme()
      end,
      desc = "Cycle Themes",
      icon = "",
    },
  },

  -- PLUGIN MAPPINGS
  {
    group = "Plugins",
    icon = "",
    -- Copilot setup
    { "<leader>cs", ":Copilot<CR>", desc = "Copilot Start", icon = "" },
    { "<leader>cd", ":Copilot disable<CR>", desc = "Copilot Disable", icon = "" },
    { "<leader>ce", ":Copilot enable<CR>", desc = "Copilot Enable", icon = "" },

    -- Oil.nvim setup
    { "<leader>-", ":Oil<CR>", desc = "Open Oil file manager", icon = "󰏇" },
    {
      "-",
      function()
        require("oil").toggle_float()
      end,
      desc = "Toggle Oil floating window",
      icon = "󰏇",
    },

    -- Rust Crates setup
    { "<leader>rU", ":Crates update_all_crates<CR>", desc = "Upgrade all crates", icon = "" },
    { "<leader>ru", ":Crates upgrade_crate<CR>", desc = "Upgrade this crate", icon = "" },
    { "<leader>rs", ":Crates show_popup<CR>", desc = "Show crate popup", icon = "" },

    -- Todo-comments.nvim
    { "<leader>td", ":TodoTelescope<CR>", desc = "Todo Comments", icon = "" },
    { "<leader>tl", ":TodoLocList<CR>", desc = "Todo Location List", icon = "󰓱" },
    { "<leader>tq", ":TodoQuickFix<CR>", desc = "Todo Quickfix", icon = "󰁨" },

    -- Leap.nvim
    { "f", "<Plug>(leap-forward)", desc = "Leap Forward", mode = { "n", "x", "o" }, icon = "" },
    { "F", "<Plug>(leap-backward)", desc = "Leap Backward", mode = { "n", "x", "o" }, icon = "" },
    { "gs", "<Plug>(leap-from-window)", desc = "Leap from Window", mode = { "n", "x", "o" }, icon = "" },

    -- Renamer.nvim
    {
      "<leader>ra",
      '<cmd>lua require("renamer").rename()<cr>',
      desc = "Rename",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      icon = "󰑕",
    },
    {
      "<F2>",
      '<cmd>lua require("renamer").rename()<cr>',
      desc = "Rename",
      mode = "i",
      noremap = true,
      silent = true,
      icon = "󰑕",
    },

    -- Boo.nvim
    {
      "<leader>lf",
      function()
        require("boo").boo()
      end,
      desc = "Docs Popup",
      icon = "󰙎",
    },

    -- NoNeckPain
    { "<leader>ne", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain", icon = "" },
    { "<leader>ns", ":NoNeckPainResize ", desc = "Resize buffer <x>", icon = "󰕮" },
    { "<leader>nn", "<cmd>NoNeckPainScratchPad<cr>", desc = "Scratchpad Notes", icon = "󱦹" },
    { "<leader>nl", "<cmd>NoNeckPainToggleLeftSide<cr>", desc = "Toggle Left Side", icon = "" },
    { "<leader>nr", "<cmd>NoNeckPainToggleRightSide<cr>", desc = "Toggle Right Side", icon = "" },
  },
  {
    group = "Obsidian",
    icon = "",
    -- obsidian.nvim
    { "<leader>ob", "<cmd>ObsidianBackLinks<cr>", desc = "obs backlinks", icon = "" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "obs daily notes", icon = "" },
    { "<leader>oe", "<cmd>ObsidianExtractNote<cr>", desc = "obs extract selected", mode = "v", icon = "󰢷" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "obs list links", icon = "" },
    { "<leader>oln", "<cmd>ObsidianLinkNew<cr>", desc = "obs new link", mode = "v", icon = "" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "obs new note", icon = "" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "obs app", icon = "󰂮" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "obs rename file", icon = "󰑕" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "obs search", icon = "" },
    { "<leader>ot", "<cmd>ObsidianTOC<cr>", desc = "obs table of contents", icon = "󰓱" },
    { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "obs checkbox toggle", icon = "" },
  },
}
