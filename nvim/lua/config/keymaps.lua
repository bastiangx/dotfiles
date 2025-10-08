-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = false })

vim.keymap.set("n", "<leader>aa", "ggVG", { desc = "Select whole file" })
vim.keymap.set("n", "<leader>ac", "ggVGy", { desc = "Yank whole file" })
vim.keymap.set("n", "<leader>ap", "ggVGp", { desc = "Replace whole file with clipboard" })

-- mainly for markdown and agent context files
-- reduces token usage
vim.api.nvim_create_user_command(
  "DeleteEmptyLines",
  ":%g/^\\s*$/d",
  {
    desc = "Delete all empty and whitespace lines",
    nargs = 0,
  }
)
vim.keymap.set("n", "<leader>af", ":DeleteEmptyLines<CR>", { desc = "Delete Empty Lines" })
