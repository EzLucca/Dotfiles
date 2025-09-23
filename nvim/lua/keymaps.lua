
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ec', ':tabnew | Ex ~/Documents/dotfiles/nvim<CR>', { desc = 'Edit nvim config' })

-- Increase window width
vim.keymap.set('n', '<A-Right>', function()
	vim.cmd('vertical resize +2')
end, { noremap = true, silent = true })

-- Decrease window width
vim.keymap.set('n', '<A-Left>', function()
	vim.cmd('vertical resize -2')
end, { noremap = true, silent = true })


vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'File explorer' })
vim.keymap.set("n", "<leader>fs", vim.cmd.w, { desc = 'File Save' })
vim.keymap.set("n", "<leader>fq", vim.cmd.q, { desc = 'File Quit' })
vim.keymap.set("n", "<leader>qa", vim.cmd.qa, { desc = 'Quit All' })

vim.keymap.set("n", "<leader>wv", "<C-w><C-v>", { desc = 'Vertical split' })
vim.keymap.set("n", "<leader>ws", "<C-w><C-s>", { desc = 'Horizontal split' })
vim.keymap.set("n", "<leader>wq", "<C-w><C-q>", { desc = 'Close window' })

vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = 'Move left window' })
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = 'Move right window' })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = 'Move down window' })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = 'Move up window' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'Copy selected to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Copy line to clipboard' })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>if", "mzgg=G'z", { desc = 'Indent file' })

vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = 'Substitute word' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = 'Make file executable' })

vim.keymap.set("n", "<leader><leader>", "/", { desc = 'Search in file' } )
vim.keymap.set("n", "<leader>om", ":Man ", { desc = 'Open Manual' })
vim.keymap.set("n", "<leader>oe", "<C-^>", { desc = 'Previous file' })
vim.keymap.set("n", "<leader>ot", ":tabnew <CR>", { desc = 'Open tab' })
vim.keymap.set("n", "<leader>of", ":e **/*", { desc = 'Open file' })

vim.keymap.set("n", "<leader>ff", ":find *", { desc = 'File find' })
vim.keymap.set("n", "<leader>s<leader>", ":sfind *", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v<leader>", ":vert sfind *", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t<leader>", ":tabfind *", { noremap = true, silent = true })

-- Define the rename command
vim.api.nvim_create_user_command("RenameVar", function()
	local old = vim.fn.input("Old variable name: ")
	if old == "" then return end

	local new = vim.fn.input("New variable name: ")
	if new == "" then return end

	local files = vim.fn.input("Files to search: ")
	-- Recursively load .c and .h files
	local arg = string.format("args %s", files)
	vim.cmd(arg)

	-- Perform rename
	local cmd = string.format("argdo %%s/\\<%s\\>/%s/gce | update", old, new)
	vim.cmd(cmd)
end, {})

-- Keybinding to run it
vim.keymap.set("n", "<leader>rn", ":RenameVar<CR>", { desc = "Rename variable across files" })
vim.keymap.set("n", "<leader>ct", "<cmd>!ctags -R .<CR>", { desc = "Create tag file" })

