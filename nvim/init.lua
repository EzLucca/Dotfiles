-- init.lua --------------------------------------------------------------------

require("vim-options")
require("keymaps")

require("plugins")
require('vim._core.ui2').enable({})
require("config-lsp")
-- Personalized
require("functions")
require("searchg")
require("terminal")
require("personal")
require("notes")
vim.cmd.colorscheme("retrobox")
