require("coerce").setup {
  keymap_registry = require("coerce.keymap").keymap_registry(),
  -- The notification function used during error conditions.
  notify = function(...)
    return vim.notify(...)
  end,
  default_mode_keymap_prefixes = {
    normal_mode = "gr",
    motion_mode = "gr",
    visual_mode = "gr",
  },
  -- If you don’t like the default cases and modes, you can override them.
  -- cases = require("coerce").default_cases,
  -- modes = require("coerce").get_default_modes(self.keymap_prefixes),
}
