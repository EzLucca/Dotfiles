-- File: lua/themes.lua
local M = {}

-- Load your colorschemes
M.available_themes = {
    mytheme = require("colors.mytheme"),
    nord    = require("colors.nord"),
}

M.current_theme = nil

-- Set a specific theme
function M.set_theme(name)
    local theme = M.available_themes[name]
    if not theme then
        vim.notify("Theme not found: " .. name, vim.log.levels.ERROR)
        return
    end
    theme.colorscheme()
    M.current_theme = name
    vim.notify("Theme set to " .. name)
end

-- Cycle through all available themes
function M.cycle_theme()
    local keys = vim.tbl_keys(M.available_themes)
    local next_index = 1
    if M.current_theme then
        for i, name in ipairs(keys) do
            if name == M.current_theme then
                next_index = i % #keys + 1
                break
            end
        end
    end
    M.set_theme(keys[next_index])
end

function M.open_xterm()
    if not M.current_theme then
        vim.notify("No theme active, default colors will be used")
        return
    end

    local file_dir = vim.fn.expand("%:p:h")
    local theme_colors = M.available_themes[M.current_theme].colors

    vim.fn.jobstart({
        "xterm",
        "-geometry", "80x9999+0+0",
        "-bg", theme_colors.bg,
        "-fg", theme_colors.fg,
        "-cr", theme_colors.fg,
        "-fa", "Monospace",
        "-fs", "12",
        "-e", "bash", "-c", "cd '" .. file_dir .. "' && exec bash"
    }, { detach = true })
end

return M
