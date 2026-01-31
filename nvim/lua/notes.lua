
-- Scratch
vim.keymap.set('n', '<leader>nj', function()
	local filepath = vim.fn.system("~/Documents/dotfiles/scripts/note_d.sh"):gsub("%s+$", "")
	vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
	vim.cmd("vertical resize 50")
end, { desc = 'Open or create dated scratch file' })

-- Specific Note 

vim.keymap.set('n', '<leader>nn', ':! ~/Documents/dotfiles/scripts/note_z.sh ', { desc = 'Create note' })
vim.keymap.set('n', '<leader>nu', ':! ~/Documents/dotfiles/scripts/note_z.sh --tags<CR>', { desc = 'Update tags' })

vim.keymap.set('n', '<leader>nf', ':tabnew | Ex ~/Documents/Notes/<CR>', { desc = 'Search notes' })
