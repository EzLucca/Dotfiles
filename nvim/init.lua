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
require("personal")
require("lsp-config")
vim.cmd("colorscheme mytheme")

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
