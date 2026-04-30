-- init.lua --------------------------------------------------------------------
-- require('vim._core.ui2').enable({})

vim.cmd.colorscheme("retrobox")
require("vim-options")
require("keymaps")

-- Plugins home
-- require("config-lsp")

-- Plugins 42
require("config-lazy")
require("config2-lsp")
-- Personalized
require("functions")
require("searchg")
require("terminal")
require("personal")
require("notes")
