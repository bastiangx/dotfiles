---@diagnostic disable: undefined-global

return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    code = {
      sign = true,
      language_name = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
    checkbox = {
      enabled = true,
    },
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  config = function(_, opts)
    require("render-markdown").setup(opts)

    -- Rose Pine color palette
    local rose_pine = {
      base = "#191724",
      surface = "#1f1d2e",
      overlay = "#26233a",
      muted = "#6e6a86",
      subtle = "#908caa",
      text = "#e0def4",
      love = "#eb6f92",
      gold = "#f6c177",
      rose = "#ebbcba",
      pine = "#31748f",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      highlight_low = "#21202e",
      highlight_med = "#403d52",
      highlight_high = "#524f67",
    }

    -- Headings using official Rose Pine semantic mapping
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = rose_pine.iris, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = rose_pine.foam, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = rose_pine.rose, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = rose_pine.gold, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = rose_pine.pine, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = rose_pine.foam, bold = true })

    -- Heading backgrounds - subtle overlay
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = rose_pine.overlay })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = rose_pine.overlay })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = rose_pine.overlay })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = rose_pine.overlay })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = rose_pine.overlay })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = rose_pine.overlay })

    -- Code blocks - surface background
    vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = rose_pine.base})
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = rose_pine.surface })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = rose_pine.surface })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { fg = rose_pine.subtle })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeFallback", { fg = rose_pine.subtle })

    -- Block quotes - muted color
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote1", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote2", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote3", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote4", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote5", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote6", { fg = rose_pine.muted })

    -- Lists and bullets - subtle
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = rose_pine.subtle })

    -- Checkboxes - using Rose Pine semantic colors
    vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = rose_pine.foam })
    vim.api.nvim_set_hl(0, "RenderMarkdownTodo", { fg = rose_pine.rose })

    -- Tables - text for content, subtle for fills
    vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = rose_pine.text, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableRow", { fg = rose_pine.text })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = rose_pine.muted })

    -- Links - iris color (official Rose Pine link color)
    vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = rose_pine.iris, underline = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownWikiLink", { fg = rose_pine.iris })

    -- Callouts using official Rose Pine semantic mapping
    vim.api.nvim_set_hl(0, "RenderMarkdownSuccess", { fg = rose_pine.foam })
    vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = rose_pine.foam })
    vim.api.nvim_set_hl(0, "RenderMarkdownHint", { fg = rose_pine.iris })
    vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = rose_pine.gold })
    vim.api.nvim_set_hl(0, "RenderMarkdownError", { fg = rose_pine.love })

    -- Other elements
    vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownSign", { bg = rose_pine.base })
    vim.api.nvim_set_hl(0, "RenderMarkdownMath", { fg = rose_pine.subtle })
    vim.api.nvim_set_hl(0, "RenderMarkdownIndent", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownHtmlComment", { fg = rose_pine.muted })
    vim.api.nvim_set_hl(0, "RenderMarkdownInlineHighlight", { bg = rose_pine.overlay })

    Snacks.toggle({
      name = "Render Markdown",
      get = function()
        return require("render-markdown.state").enabled
      end,
      set = function(enabled)
        local m = require("render-markdown")
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    }):map("<leader>um")
  end,
}
