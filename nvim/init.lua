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

require("vim-options")
require("lazy").setup("plugins")

-- Enable true color support
vim.opt.termguicolors = true

-- Set active status line color (muted green)
vim.api.nvim_set_hl(0, 'StatusLine', {
  fg = '#262626',    -- Muted green text color
  bg = '#5f875f',    -- Dark background
  bold = true        -- Optional: Make it bold
})

-- Set inactive status line color (muted gray)
vim.api.nvim_set_hl(0, 'StatusLineNC', {
  fg = '#7f7f7f',    -- Muted gray text color
  bg = '#2e2e2e',    -- Dark background
  italic = true      -- Optional: Italicize text when inactive
})

