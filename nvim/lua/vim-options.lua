
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set splitright")
vim.cmd("set splitbelow")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.fillchars = {
	vert = ' ',      -- No character for vertical splits
	horiz = ' ',     -- No character for horizontal splits
	vertleft = ' ',  -- No character for left vertical corners
	vertright = ' ', -- No character for right vertical corners
	horizup = ' ',   -- No character for upper horizontal corners
	horizdown = ' ',  -- No character for bottom horizontal corners
	eob = ' '
}

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'File explorer' })
vim.keymap.set("n", "<leader>fs", vim.cmd.w, { desc = 'File Save' })
vim.keymap.set("n", "<leader>fq", vim.cmd.q, { desc = 'File Quit' })

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

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'Copy selected to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Copy line to clipboard' })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>if", "mzgg=G'z", { desc = 'Indent file' })

vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = 'Substitute word' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = 'Make file executable' })

vim.keymap.set("n", "<leader>om", ":Man ", { desc = 'Open Manual' })
vim.keymap.set("n", "<leader>of", ":e *", { desc = 'Open file' })
vim.keymap.set("n", "<leader>ff", ":find *", { desc = 'File find' })
vim.keymap.set("n", "<leader>jd", ":tag <C-r><C-w> <CR>" , { desc = 'Jump definition' })

-- open shell inside nvim
vim.o.shell = "/usr/bin/fish"
vim.keymap.set("n", "<leader>tv", ":vert term <CR>", { desc = 'Open v term' })
vim.keymap.set("n", "<leader>th", ":term <CR>", { desc = 'Open h term' })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local opts = { buffer = 0, noremap = true }

		-- Exit terminal mode
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

		-- Close terminal with <leader>q
		vim.keymap.set("t", "<leader>q", [[<C-\><C-n>:bd!<CR>]], opts)

		-- Navigate windows from terminal
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
	end,
})
