return {
  leader_key = "m",
  show_icons = true,
  always_show_path = false,
  separate_by_branch = true, -- Bookmarks will be separated by git branch
  hide_handbook = false, -- set to true to hide the shortcuts on menu.
  save_path = function()
    return vim.fn.stdpath "cache" .. "/arrow"
  end,
  mappings = {
    edit = "e",
    delete_mode = "d",
    clear_all_items = "C",
    toggle = "s", -- used as save if separate_save_and_remove is true
    open_vertical = "v",
    open_horizontal = "h",
    quit = "q",
    remove = "x", -- only used if separate_save_and_remove is true
    next_item = "n",
    prev_item = "p",
  },
  -- custom_actions = {
  -- 	open = function(target_file_name, current_file_name) end, -- target_file_name = file selected to be open, current_file_name = filename from where this was called
  -- 	split_vertical = function(target_file_name, current_file_name) end,
  -- 	split_horizontal = function(target_file_name, current_file_name) end,
  -- },
  window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
    relative = "editor",
    width = "auto",
    height = "auto",
    row = "auto",
    col = "auto",
    title = "Arrow",
    border = "rounded",
  },
  per_buffer_config = {
    lines = 4, -- Number of lines showed on preview.
    sort_automatically = true, -- Auto sort buffer marks.
    satellite = { -- defualt to nil, display arrow index in scrollbar at every update
      enable = true,
      overlap = true,
      priority = 1000,
    },
    zindex = 10, --default 50
    treesitter_context = nil, -- it can be { line_shift_down = 2 }, currently not usable, for detail see https://github.com/otavioschwanck/arrow.nvim/pull/43#issue-2236320268
  },
  separate_save_and_remove = false, -- if true, will remove the toggle and create the save/remove keymaps.
  save_key = "git_root", -- what will be used as root to save the bookmarks. Can be also `git_root`.
  global_bookmarks = false, -- if true, arrow will save files globally (ignores separate_by_branch)
  index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
  full_path_list = { "update_stuff" }, -- filenames on this list will ALWAYS show the file path too.
}
