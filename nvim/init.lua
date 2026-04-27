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

vim.cmd.colorscheme("retrobox")
require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
require("functions")
require("lsp-config")
require("searchg")
require("terminal")
require("personal")
require("notes")
