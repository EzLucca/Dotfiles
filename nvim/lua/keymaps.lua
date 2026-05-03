-- keymaps.lua -----------------------------------------------------------------

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ec', ':tabnew | Ex ~/Documents/MySetup/dotfiles/nvim<CR>', { desc = 'Edit nvim config' })

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'File explorer' })
vim.keymap.set("n", "<leader>fs", vim.cmd.w, { desc = 'File Save' })
vim.keymap.set("n", "<leader>fq", vim.cmd.q, { desc = 'File Quit' })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Esc insert mode" })

-- File search
vim.keymap.set("n", "<leader>ff", ":find ", { desc = 'File find' })
vim.keymap.set("n", "<leader>s<leader>", ":sfind ", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v<leader>", ":vert sfind ", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t<leader>", ":tabfind ", { noremap = true, silent = true })

-- Windows management
vim.keymap.set("n", "<leader>sv", "<C-w><C-v>", { desc = 'Vertical split' })
vim.keymap.set("n", "<leader>sh", "<C-w><C-s>", { desc = 'Horizontal split' })
vim.keymap.set("n", "<leader>fq", "<C-w><C-q>", { desc = 'Close window' })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Windows navigation
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = 'Move left window' })
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = 'Move right window' })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = 'Move down window' })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = 'Move up window' })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Next location list" })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Prev location list" })

-- Lines editing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Better indenting in visual mode
vim.keymap.set("n", "<leader>if", "mzgg=G'z", { desc = 'Indent file' })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = 'Substitute word' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = 'Make file executable' })

vim.keymap.set("n", "g<leader>", "/", { desc = 'Search in file' } )
vim.keymap.set("n", "<leader>om", ":Man ", { desc = 'Open Manual' })

-- Tab managment
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })

-- undo tree
vim.keymap.set('n', '<leader>u', function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = 'toggle builting undotree' })
