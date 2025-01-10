return {
  { import = "lazyvim.plugins.extras.editor.leap" },
  {
    "ggandor/leap.nvim",
    vscode = true,
    dependencies = {
      "ggandor/leap-spooky",
      vscode = true,
    },
    keys = {
      { "f", "<Plug>(leap-forward)", desc = "Leap Forward", mode = { "n", "x", "o" }, icon = "" },
      { "F", "<Plug>(leap-backward)", desc = "Leap Backward", mode = { "n", "x", "o" }, icon = "" },
    },
    opts = {
      prefix = true,
      paste_on_remote_yank = true,
    },
  },
}
