-- init.lua --------------------------------------------------------------------

require("vim-options")
require("keymaps")

-- Plugins home
require("plugins")
require('vim._core.ui2').enable({})
require("config-lsp")

-- Plugins 42
-- require("config-lazy")
-- require("config2-lsp")

-- Personalized
require("functions")
require("searchg")
require("terminal")
require("personal")
require("notes")
vim.cmd.colorscheme("retrobox")
