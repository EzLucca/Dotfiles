
vim.keymap.set("n", "<leader>og", function()
	local word = vim.fn.expand("<cword>")
	-- This does recursive search for the word in all files
	vim.cmd("vimgrep /" .. word .. "/gj **/*")
	vim.cmd("copen")
end, { desc = "Grep current word and open quickfix" })

vim.keymap.set("n", "<leader>qg", function()
	vim.fn.setqflist({})
	vim.cmd("cclose")
end, { desc = "Clear and close quickfix" })

