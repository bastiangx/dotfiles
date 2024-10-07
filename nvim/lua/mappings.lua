local wk = require "which-key"
local legacy = vim.keymap.set

legacy("n", ";", ":", { desc = "command mode" })

wk.add {
  -- NVIM MAPPINGS
  {
    group = "NVIM",--
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
    { "<A-.>", "<C-w>2<", desc = "Decrease width", icon = "" },
    { "<A-,>", "<C-w>2>", desc = "Increase width", icon = "" },
    { "<A-i>", "<C-w>2-", desc = "Decrease height", icon = "" },
    { "<A-u>", "<C-w>2+", desc = "Increase height", icon = "" },
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

  -- LSP MAPPINGS
  {
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
    group = "Quotes Formatting",
    icon = "󱇚",
    {
      "<leader>mqe",
      function()
        vim.cmd "setlocal fo+=r"
        vim.cmd "setlocal comments+=b:>"
      end,
      desc = "enable quotes formatting",
      icon = "",
    },
    {
      "<leader>mqd",
      function()
        vim.cmd "setlocal fo-=r"
        vim.cmd "setlocal comments-=b:>"
      end,
      desc = "disable quotes formatting",
      icon = "",
    },
  },
}


------------------------------------------
-- NVChad defailt mappings --
-- ---------------------------------------

local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })
