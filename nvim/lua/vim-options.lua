
vim.cmd("set softtabstop=4")
-- vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd('packadd termdebug')

vim.o.autochdir = true
vim.o.mouse = "a"

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.splitright = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.opt.fillchars = {
	-- vert = '│', -- single line for vertical splits
	vert = ' ',      -- No character for vertical splits
	horiz = ' ',     -- No character for horizontal splits
	vertleft = ' ',  -- No character for left vertical corners
	vertright = ' ', -- No character for right vertical corners
	horizup = ' ',   -- No character for upper horizontal corners
	horizdown = ' ',  -- No character for bottom horizontal corners
	eob = ' '
}

-- Set the color of the separator line
-- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#000000', bold = true })

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

-- open shell inside nvim
vim.o.shell = "/usr/bin/fish"
vim.keymap.set("n", "<leader>tv", ":vert term <CR>", { desc = 'Open vertical term' })
vim.keymap.set("n", "<leader>tt", ":10sp | term <CR>", { desc = 'Open horizontal term' })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local opts = { buffer = 0, noremap = true }

		-- Exit terminal mode
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

		-- Close terminal with <leader>q
		vim.keymap.set("t", "<leader>q", [[<C-\><C-n>:bd!<CR>]], opts)

		-- Navigate windows from terminal
		vim.keymap.set("t", "<leader>wh", [[<C-\><C-n><C-w>h]], opts)
		vim.keymap.set("t", "<leader>wj", [[<C-\><C-n><C-w>j]], opts)
		vim.keymap.set("t", "<leader>wk", [[<C-\><C-n><C-w>k]], opts)
		vim.keymap.set("t", "<leader>wl", [[<C-\><C-n><C-w>l]], opts)
	end,
})

