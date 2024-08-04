local crates = require("crates")
crates.setup({
  lsp = {
    enable = true,
    actions = true,
    completion = true,
    hover = true,
  },
  completion = {
    crates = {
      enabled = true,
      max_results = 12,
      min_chars = 2,
    },
  }
})

crates.show()
