-- personal.lua ----------------------------------------------------------------

vim.keymap.set("n", "<leader>ov", function()
	vim.cmd("lcd %:p:h")
	vim.cmd("vert term")
end, { desc = "Open vertical term" })

vim.keymap.set("n", "<leader>os", function()
	vim.cmd("lcd %:p:h")
	vim.cmd("10sp | term")
end, { desc = "Open horizontal term" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local opts = { buffer = 0, noremap = true }
		-- Navigate windows from terminal
		vim.keymap.set("t", "<leader>wh", [[<C-\><C-n><C-w>h]], opts)
		vim.keymap.set("t", "<leader>wj", [[<C-\><C-n><C-w>j]], opts)
		vim.keymap.set("t", "<leader>wk", [[<C-\><C-n><C-w>k]], opts)
		vim.keymap.set("t", "<leader>wl", [[<C-\><C-n><C-w>l]], opts)
	end,
})
