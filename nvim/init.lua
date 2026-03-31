local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("lazy").setup("plugins")
require("vim-options")
require("searchg")
require("notes")
require("comment")
require("pomodoro")
require("personal")
require("lsp-config")
-- vim.cmd("colorscheme mytheme")

-- Remove background, color only the text
vim.api.nvim_set_hl(0, "Search", {
  fg = "#ff8800",   -- text color
  bg = "NONE",      -- no background
  bold = true
})

vim.api.nvim_set_hl(0, "IncSearch", {
  fg = "#ff0000",
  bg = "NONE",
  bold = true
})

local themes = require("themes")
themes.set_theme("mytheme")

vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#fb4934", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#b8bb26", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#83a598", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#d3869b", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#8ec07c", bold = true })

