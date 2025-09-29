
vim.keymap.set("n", "<leader>og", function()
  local word = vim.fn.expand("<cword>")
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("vimgrep /" .. word .. "/gj " .. dir .. "/**/*")
  vim.cmd("copen")
end, { desc = "Grep current word" })

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
    local pattern = vim.fn.escape(input, "/\\")
    local dir = vim.fn.expand("%:p:h")
    vim.cmd("vimgrep /" .. pattern .. "/gj " .. dir .. "/**/*")
    vim.cmd("copen")
  end)
end, { desc = "Grep input string" })
