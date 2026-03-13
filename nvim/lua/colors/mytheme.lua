-- File: ~/.config/nvim/colors/mytheme.lua
local M = {}

-- Define your color palette

M.colors = {
	bg       = "#1e1e1e",  -- Grey15
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
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.colorscheme()
	-- Clear existing highlights
	vim.cmd("highlight clear")
	vim.o.background = "dark"
	vim.g.colors_name = "mytheme"

	-- Example highlights
	-- highlight("Normal", { fg = colors.fg }) -- For transparency
	highlight("Normal", { fg = M.colors.fg, bg = M.colors.bg })
	highlight("@Variable", { fg = M.colors.salmon, bg = M.colors.bg })
	highlight("@Constant", { fg = M.colors.blue, bg = M.colors.bg })
	highlight("Comment", { fg = M.colors.comment, italic = true })
	highlight("Error", { fg = M.colors.red, bold = true })
	highlight("Function", { fg = M.colors.purple})
	highlight("Type", { fg = M.colors.green})
	highlight("special", { fg = M.colors.green})
	highlight("Identifier", { fg = M.colors.salmon})
	highlight("Keyword", { fg = M.colors.orange, bold = true })
	highlight("String", { fg = M.colors.green})
	highlight("Number", { fg = M.colors.yellow })
	highlight("Directory", { fg = M.colors.purple})
	highlight("Statement", { fg = M.colors.purple})
	highlight("StatusLine", { fg = M.colors.black, bg = M.colors.line })
	highlight("StatusLineNC", { fg = M.colors.black, bg = M.colors.comment})
	-- highlight("NormalNC", { fg = colors.orange, bg = "#282828"})
	-- Add more highlight groups as needed
end

return M

