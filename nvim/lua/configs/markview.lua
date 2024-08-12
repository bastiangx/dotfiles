-- local foreground = "#1e1e2e"

-- require("markview").setup {
--   highlight_groups = {
--     {
--       group_name = "Heading1",
--       value = { fg = foreground, bg = "#a6e3a1", bold = true},
--     },
--     {
--       group_name = "Heading1Corner",
--       value = { fg = "#a6e3a1" },
--     },
--   },
--   headings = {
--     enable = true,
--     shift_width = 0,
--
--     heading_1 = {
--       style = "label",
--
--       padding_left = " ",
--       padding_right = " ",
--
--       corner_right = "",
--       corner_right_hl = "Heading1Corner",
--
--       hl = "Heading1",
--     },
--   },
-- }
--


require("markview").setup {
  highlight_groups = {
    {
      group_name = "Heading1",
      value = { fg = "#31748f", bold = true }, -- Rose Pine "foam" color
    },
    {
      group_name = "Heading1Corner",
      value = { fg = "#31748f" }, -- Matches Heading1 color
    },
    {
      group_name = "Heading2",
      value = { fg = "#c4a7e7", bold = true }, -- Rose Pine "iris" color
    },
    {
      group_name = "Heading2Corner",
      value = { fg = "#c4a7e7" }, -- Matches Heading2 color
    },
    {
      group_name = "Heading3",
      value = { fg = "#f6c177", bold = true }, -- Rose Pine "gold" color
    },
    {
      group_name = "Heading3Corner",
      value = { fg = "#f6c177" }, -- Matches Heading3 color
    },
    {
      group_name = "Heading4",
      value = { fg = "#9ccfd8", bold = true }, -- Rose Pine "pine" color
    },
    {
      group_name = "Heading4Corner",
      value = { fg = "#9ccfd8" }, -- Matches Heading4 color
    },
    {
      group_name = "Heading5",
      value = { fg = "#eb6f92", bold = true }, -- Rose Pine "love" color
    },
    {
      group_name = "Heading5Corner",
      value = { fg = "#eb6f92" }, -- Matches Heading5 color
    },
    {
      group_name = "Heading6",
      value = { fg = "#ea9a97", bold = true }, -- Rose Pine "love" color
    },
    {
      group_name = "Heading6Corner",
      value = { fg = "#ea9a97" }, -- Matches Heading6 color
    },
  },
  headings = {
    enable = true,
    shift_width = 0,

    heading_1 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading1Corner",

      hl = "Heading1",
    },
    heading_2 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading2Corner",

      hl = "Heading2",
    },
    heading_3 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading3Corner",

      hl = "Heading3",
    },
    heading_4 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading4Corner",

      hl = "Heading4",
    },
    heading_5 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading5Corner",

      hl = "Heading5",
    },
    heading_6 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "",
      corner_right_hl = "Heading6Corner",

      hl = "Heading6",
    },
  },
}
