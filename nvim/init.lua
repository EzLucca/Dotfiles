-- init.lua --------------------------------------------------------------------

vim.cmd.colorscheme("retrobox")
require("vim-options")
require("keymaps")
--
-- require("lazy").setup("plugins")
-- require("lsp-config")
-- require("plugins")
--
-- Plugins
require("config-lazy")
require("config-lsp")
require("config-cmp")

-- Personalized
require("functions")
require("searchg")
require("terminal")
require("personal")
require("notes")
