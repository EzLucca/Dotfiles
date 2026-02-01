
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
  vim.ui.input({ prompt = "Grep (space separated): " }, function(input)
    if not input or input == "" then
      vim.notify("Search cancelled", vim.log.levels.INFO)
      return
    end

    local patterns = vim.split(input, "%s+")
    local dir = vim.fn.expand("%:p:h") -- folder of current file
    local cmd

    if #patterns == 1 then
      -- Only one argument
      cmd = 'grep -rl ' .. vim.fn.shellescape(patterns[1]) .. ' ' .. dir
    else
      -- Two or more arguments: chain grep with xargs
      cmd = 'grep -rl ' .. vim.fn.shellescape(patterns[1]) .. ' ' .. dir
      for i = 2, #patterns do
        cmd = cmd .. ' | xargs grep -l ' .. vim.fn.shellescape(patterns[i])
      end
    end

    local results = vim.fn.systemlist(cmd)

    if #results == 0 then
      vim.notify("No matches found", vim.log.levels.INFO)
      return
    end

    vim.fn.setqflist({}, " ", {
      title = "Grep: " .. table.concat(patterns, ", "),
      lines = results,
    })

    vim.cmd("copen")
  end)
end, { desc = "Grep files in current folder (1 or more patterns)" })

