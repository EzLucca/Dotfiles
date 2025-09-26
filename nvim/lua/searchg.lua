
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

vim.keymap.set("n", "<leader>gg", function()
  vim.ui.input({ prompt = "Grep for: " }, function(input)
    if input == nil or input == "" then
      vim.notify("Search cancelled", vim.log.levels.INFO)
      return
    end
    -- Escape slashes and other characters if needed
    local pattern = vim.fn.escape(input, "/\\")
    vim.cmd("vimgrep /" .. pattern .. "/gj **/*")
    vim.cmd("copen")
  end)
end, { desc = "Grep input string and open quickfix" })


