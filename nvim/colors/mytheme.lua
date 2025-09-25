-- File: ~/.config/nvim/colors/mytheme.lua
local M = {}

-- Define your color palette

local colors = {
	-- bg       = "#262626",  -- Grey15
	bg       = "#1f1f1f",  -- Grey15
	fg       = "#afafaf",  -- Grey69
	red      = "#f7768e",  -- Rosy red
	green    = "#5f875f",  -- Lime green
	yellow   = "#e0af68",  -- Warm yellow
	blue     = "#7aa2f7",  -- Bright sky blue
	purple   = "#875faf",  -- MediumPurple3
	orange   = "#af5f00",  -- DarkOrange3
	salmon	 = "#af8787",  -- RoseSalmon
	comment  = "#626262",  -- Grey35
	line	 = "#5f875f",  -- Blue-ish purple
	black    = "#000000",  -- Text color for status line
}

-- Use Neovim highlight API
local function highlight(group, color)
	vim.api.nvim_set_hl(0, group, color)
end

function M.colorscheme()
	-- Clear existing highlights
	vim.cmd("highlight clear")
	vim.o.background = "dark"
	vim.g.colors_name = "mytheme"

	-- Example highlights
	highlight("Normal", { fg = colors.fg, bg = colors.bg })
	highlight("@Variable", { fg = colors.salmon, bg = colors.bg })
	highlight("@Constant", { fg = colors.blue, bg = colors.bg })
	highlight("Comment", { fg = colors.comment, italic = true })
	highlight("Error", { fg = colors.red, bold = true })
	highlight("Function", { fg = colors.purple})
	highlight("Type", { fg = colors.green})
	highlight("special", { fg = colors.green})
	highlight("Identifier", { fg = colors.salmon})
	highlight("Keyword", { fg = colors.orange, bold = true })
	highlight("String", { fg = colors.green})
	highlight("Number", { fg = colors.yellow })
	highlight("Directory", { fg = colors.purple})
	highlight("Statement", { fg = colors.purple})
	highlight("StatusLine", { fg = colors.black, bg = colors.line })
	highlight("StatusLineNC", { fg = colors.black, bg = colors.comment})
	highlight("NormalNC", { fg = colors.orange, bg = "#282828"})
	-- Add more highlight groups as needed
end

M.colorscheme()

return M

