-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  -- NVChad stuff
  theme = "tundra",
  theme_toggle = { "tundra", "tundra" },
  transparency = true,

  -- highlights
  hl_override = {
    Comment = { italic = true, fg = "#4c566a" },
    ["@comment"] = { link = "Comment" },
    ["@comment.rust"] = { link = "Comment" },
    ["@comment.python"] = { link = "Comment" },
    ["@comment.java"] = { link = "Comment" },
    ["@comment.markdown"] = { link = "Comment" },
    ["@comment.txt"] = { link = "Comment" },
    ["@comment.css"] = { link = "Comment" },
    ["@comment.toml"] = { link = "Comment" },

    -- Types
    ["rustTypedef"] = { italic = true },
    ["type"] = { italic = true },
    ["@type"] = { italic = true },
    ["Type"] = { italic = true },

    -- Delimiter for miniIndent lines
    ["Delimiter"] = { fg = "#4c566a" },
    ["@delimiter"] = { link = "Delimiter" },
  },
}

return M
