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

-- Require Treesitter utils

-- Function to calculate size of current function
function _G.function_size_status()
	local ts_utils = vim.treesitter
	local node = ts_utils.get_node()
	while node and node:type() ~= "function_definition" and node:type() ~= "function_declaration" do
		node = node:parent()
	end
	if node then
		local start_row, _, end_row, _ = node:range()
		local lines = end_row - start_row + 1
		return "[Fn:" .. lines .. "L]"
	end
	return ""  -- show nothing if not inside a function
end
