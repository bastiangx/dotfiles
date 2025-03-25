return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  keys = {
    { "f", "<Plug>(leap-forward)", desc = "Leap Forward", mode = { "n", "x", "o" } },
    { "F", "<Plug>(leap-backward)", desc = "Leap Backward", mode = { "n", "x", "o" } },
    { "gs", "<Plug>(leap-from-window)", desc = "Leap from Window", mode = { "n", "x", "o" } },
  },
}
