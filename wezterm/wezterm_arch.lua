local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
local theme = require('lua/rose-pine').main

-- rosepine theme
config.colors = theme.colors()

config.front_end = "OpenGL"
config.max_fps = 240
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 60
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.cell_width = 0.9
config.window_background_opacity = 0.69
config.prefer_egl = true
config.font_size = 11.0

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}


-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- keymaps
config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

config.window_frame = {
	font = wezterm.font("CaskaydiaCove Nerd Font"),
}

config.window_decorations = "NONE | RESIZE"

-- detect the os, run wsl if windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl" }
else
	config.default_prog = { "zsh" }
end


config.initial_cols = 108
config.initial_rows = 38

return config
