local wezterm = require 'wezterm'
local act = wezterm.action

return {
	default_prog = { "/bin/bash", "--login" },
	window_decorations = "NONE",
	-- enable_tab_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- === Cursor ===
	default_cursor_style = "SteadyBlock",
	cursor_blink_rate = 0,

	-- === Performance ===
	front_end = "WebGpu",
	max_fps = 120,

	-- === Scroll ===
	enable_scroll_bar = false,
	scrollback_lines = 10000,

	-- === Colors (your scheme) ===
	colors = {
		foreground = "#dcdcdc",
		background = "#1e1e1e",
		cursor_bg = "#af5f00",
		cursor_border = "#af5f00",
		cursor_fg = "#1e1e1e",

		ansi = {
			"#1e1e1e",
			"#f44747",
			"#619955",
			"#ffaf00",
			"#0a7aca",
			"#b267e6",
			"#5ccfe6",
			"#dcdcdc",
		},
		brights = {
			"#5a5a5a",
			"#f44747",
			"#619955",
			"#ffaf00",
			"#0a7aca",
			"#b267e6",
			"#5ccfe6",
			"#ffffff",
		},
	},

	-- === TERM compatibility ===
	term = "xterm-256color",

	-- === Clipboard + Vim-style keys ===
	keys = {
		-- copy / paste
		{
			key = "C",
			mods = "CTRL|SHIFT",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "V",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},

		-- pane navigation (vim style)
		{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

		-- splits
		{
			key = "-",
			mods = "ALT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "ALT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},

		-- close pane
		{
			key = "x",
			mods = "ALT",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "F11", mods = "", action = act.ToggleFullScreen
		},
	},
}
