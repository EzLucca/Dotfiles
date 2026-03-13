local M = {}

-- Human-readable Nord color palette
M.colors = {
    bg       = "#2E3440", -- dark blue-gray (background)
    -- fg     = "#3B4252", -- dark gray-blue
    fg     = "#afafaf", -- dark gray-blue
    medium   = "#434C5E", -- medium gray-blue
    gray     = "#4C566A", -- gray-blue, often used for comments
    light    = "#D8DEE9", -- light gray text
    lighter  = "#E5E9F0", -- lighter gray
    bright   = "#ECEFF4", -- almost white
    red      = "#BF616A", -- muted red
    green    = "#A3BE8C", -- soft green
    yellow   = "#EBCB8B", -- warm yellow
    blue     = "#81A1C1", -- medium blue
    purple   = "#B48EAD", -- soft purple
    cyan     = "#8FBCBB", -- muted teal/cyan
    orange   = "#D08770", -- soft orange
}

-- Helper function for highlights
local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Apply Nord colorscheme
function M.colorscheme()
    local c = M.colors

    vim.cmd("highlight clear")
    vim.o.background = "dark"
    vim.g.colors_name = "nord"

    highlight("Normal",      { fg = c.light, bg = c.bg })
    highlight("Comment",     { fg = c.gray, italic = true })
    highlight("Error",       { fg = c.red, bold = true })
    highlight("Function",    { fg = c.blue })
    highlight("Type",        { fg = c.green })
    highlight("Keyword",     { fg = c.purple, bold = true })
    highlight("String",      { fg = c.green })
    highlight("Number",      { fg = c.orange })
    highlight("Identifier",  { fg = c.cyan })
    highlight("Statement",   { fg = c.purple })
    highlight("Directory",   { fg = c.blue })
    highlight("Special",     { fg = c.yellow })

    -- Status line
    highlight("StatusLine",   { fg = c.bg,    bg = c.light })
    highlight("StatusLineNC", { fg = c.gray,  bg = c.medium })
end

return M
