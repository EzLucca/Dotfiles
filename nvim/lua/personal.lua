
-- Increase window width
vim.keymap.set('n', '<A-Right>', function()
	vim.cmd('vertical resize +2')
end, { noremap = true, silent = true })

-- Decrease window width
vim.keymap.set('n', '<A-Left>', function()
	vim.cmd('vertical resize -2')
end, { noremap = true, silent = true })

-- Terminal
vim.keymap.set("n", "<leader>ob", function()
  local file_dir = vim.fn.expand('%:p:h') -- Get the directory of the current file
  local cmd = string.format("gnome-terminal --working-directory='%s' -- bash &", file_dir)
  vim.fn.jobstart(cmd, { detach = true }) -- Run it without blocking Neovim
end, { desc = "Open bash" })

vim.keymap.set("n", "<leader>ox", function()
  local file_dir = vim.fn.expand('%:p:h') -- Get the current file's directory
  local cmd = string.format(
    "xterm -fa 'Monospace' -fs 12 -e 'cd \"%s\" && exec bash' &",
    file_dir
  )
  vim.fn.jobstart(cmd, { detach = true }) -- Run it asynchronously
end, { desc = "Open xterm" })

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
local ts_utils = require'nvim-treesitter.ts_utils'

-- Function to calculate size of current function
function _G.function_size_status()
  local node = ts_utils.get_node_at_cursor()
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

-- Create the tag file on current directory
vim.keymap.set("n", "<leader>ct", function()
  local file_dir = vim.fn.expand("%:p:h")      -- Get the directory of the current file
  vim.cmd("lcd " .. file_dir)                  -- Change local working directory
  vim.cmd("!ctags -R .")                       -- Run ctags in that directory
end, { desc = "Create tag file in current file's directory" })

-- Search file on current folder
vim.keymap.set("n", "<leader>of", function()
  local dir = vim.fn.expand("%:p:h") .. "/*"
  vim.api.nvim_feedkeys(":e " .. dir, "n", false)
end, { desc = "Edit file in current file's directory" })

-- Open PDF with system default viewer (xdg-open) from netrw using <leader>z
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<leader>z", function()
      local filename = vim.fn.expand("<cfile>")
      local dir = vim.b.netrw_curdir
      local filepath = dir .. "/" .. filename

      if filename:match("%.pdf$") then
        vim.fn.jobstart({ "xdg-open", filepath }, { detach = true })
      else
        print("Not a PDF file")
      end
    end, { desc = "open pdf" }, { buffer = true, silent = true })
  end,
})
