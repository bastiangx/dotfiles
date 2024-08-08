require "nvchad.mappings"

local map = vim.keymap.set
--x: map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ### NVIM MAPPINGS ###

-- nvim override: disable new comment line format with O-key
map("n", "<leader>cl", function()
  vim.cmd "set fo-=c fo-=r fo-=o"
end, { desc = "comment format override" })
-- reverse
map("n", "<leader>cr", function()
  vim.cmd "set fo+=c fo+=r fo+=o"
end, { desc = "comments foramt default" })

-- nvim pane resizing - (Alt)
map("n", "<A-.>", "<C-w><", { desc = "decrease width" })
map("n", "<A-,>", "<C-w>>", { desc = "increase width" })
map("n", "<A-k>", "<C-w>-", { desc = "decrease height" })
map("n", "<A-j>", "<C-w>+", { desc = "increase height" })

-- nvim motion - zz on every big vertical jump
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })
map("n", "<C-b>", "<C-b>zz", { desc = "scroll back" })
map("n", "<C-f>", "<C-f>zz", { desc = "scroll forward" })

-- Quitting nvim
map("n", "<leader>Q", ":qa<CR>", { desc = "quit nvim" })

-- Visual mode mappings --
-- indent selected text
map("v", "<", "<gv", { desc = "indent" })
map("v", ">", ">gv", { desc = "indent" })

-- copy selected text into system clipboard
map("v", "<leader>y", '"+y', { desc = "Copy selected" })

-- ### LSP GENERIC MAPPINGS ###

map("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP info" })
map("n", "<leader>lQ", ":LspStop<CR>", { desc = "LSP stop <Not Recommended>" })
map("n", "<leader>lq", ":LspStop ", { desc = "LSP stop server <x>" })
map("n", "<leader>lR", ":LspRestart<CR>", { desc = "LSP restart" })
map("n", "<leader>lr", ":LspRestart ", { desc = "LSP restart <x>" })

-- Rust LSP code actions
-- lsp hover docs
map("n", "<leader>rh", function()
  require("rust-tools").hover_actions.hover_actions()
end, { desc = "Rust hover" })
-- lsp actions group
map("n", "<leader>rg", function()
  require("rust-tools").code_action_group.code_action_group()
end, { desc = "Rust actions" })

-- ### NVCHAD MAPPINGS ###

-- nvchad def
map("n", ";", ":", { desc = "CMD enter command mode" })

-- nvchad api: toggle transparency
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

-- nvchad api: cycle themes
map("n", "<leader>tn", function()
  require("base46").toggle_theme()
end, { desc = "Toggle transparency" })

--- ### PLUGIN MAPPINGS ###
--- * use <leader>p as the toggle, generic prefix *

-- Copilot setup
map("n", "<leader>cs", ":Copilot<CR>", { desc = "Copilot start" })
map("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot disable" })
map("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot enable" })

-- oil.nvim setup
map("n", "<leader>-", ":Oil<CR>", { desc = "Oil fm" })
-- floating oil
map("n", "-", function()
  require("oil").toggle_float()
end, { desc = "oil float" })

-- rust crates setup
map("n", "<leader>rU", ":Crates update_all_crates<CR>", { desc = "upgrade all crates" })
map("n", "<leader>ru", ":Crates upgrade_crate<CR>", { desc = "upgrade this crate" })
map("n", "<leader>rs", ":Crates show_popup<CR>", { desc = "popup crate" })

-- Folke/todo-comments.nvim
map("n", "<leader>td", ":TodoTelescope<CR>", { desc = "Todo comments" })
map("n", "<leader>tl", ":TodoLocList<CR>", { desc = "Todo loclist" })
map("n", "<leader>tq", ":TodoQuickFix<CR>", { desc = "Todo quickfix" })

-- ggandor/leap.nvim motions
map({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
map({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

-- SalOrak/whaler Telescope picker extension
map("n", "<leader>wp", function()
  require("telescope").extensions.whaler.whaler()
end, { desc = "Whaler picker" })

-- filipdutescu/renamer.nvim
map({ "n", "v" }, "<leader>ra", '<cmd>lua require("renamer").rename()<cr>', {
  noremap = true,
  silent = true,
  desc = "rename",
})
map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', {
  noremap = true,
  silent = true,
  desc = "rename",
})

-- "LukasPietzschmann/boo.nvim" setup
-- lsp floating diagnostics
local boo = require "boo"
map("n", "<leader>lf", function()
  boo.boo()
end, { desc = "docs popup" })
