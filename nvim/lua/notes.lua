
-- Scratch
vim.keymap.set('n', '<leader>nj', function()
	-- Get the current date
	local date = os.date("%m-%d")
	local filepath = string.format("%s/Documents/Notes/note-%s.md", vim.fn.expand("~"), date)

	-- Check if the file exists
	local file_exists = vim.fn.filereadable(filepath) == 1

	-- Create the file if it doesn't exist
	if not file_exists then
		local file = io.open(filepath, "w")
		if file then
			file:write("# Notes - " .. os.date("%d-%m-%Y") .. "\n\n")
			file:close()
		else
			vim.notify("Failed to create file: " .. filepath, vim.log.levels.ERROR)
			return
		end
	end

	-- Open the file in a vertical split and resize
	vim.cmd("vsplit " .. filepath)
	vim.cmd("vertical resize 50")
end, { desc = 'Open or create dated scratch file' })
--
--
vim.keymap.set('n', '<leader>nf', ':tabnew | Ex ~/Documents/Notes/<CR>', { desc = 'Search notes' })
