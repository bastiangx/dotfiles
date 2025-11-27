---@diagnostic disable: undefined-doc-name
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    close_if_last_window = true,
    render = {
      -- use_devicons = false,
      use_git_status_colors = true,
    },
    window = {
      width = 28,
      position = "right",
    },
    log_level = {
      file = "fatal",
      console = "fatal",
    },
    filesystem = {
      -- root_folder_modifier = "cwd",
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      components = {
        icon = function(config, node, state)
          if node.type == "file" or node.type == "directory" then
            return {}
          end
          return require("neo-tree.sources.common.components").icon(config, node, state)
        end,
      },
    },
  },
}
