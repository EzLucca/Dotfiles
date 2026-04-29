-- init.lua --------------------------------------------------------------------
require('vim._core.ui2').enable({})

vim.cmd.colorscheme("retrobox")
require("vim-options")
require("keymaps")

-- Plugins
require("config-lsp")

-- Personalized
require("functions")
require("searchg")
require("terminal")
require("personal")
require("notes")
