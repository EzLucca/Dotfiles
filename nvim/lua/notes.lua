
-- Scratch
vim.keymap.set('n', '<leader>nj', function()
	local filepath = vim.fn.system("~/Documents/dotfiles/scripts/daily_note.sh"):gsub("%s+$", "")
	vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
	vim.cmd("vertical resize 50")
end, { desc = 'Open or create dated scratch file' })

-- Specific Note 

-- vim.keymap.set('n', '<leader>nn', function()
	--   local filepath = vim.fn.system("~/Documents/dotfiles/scripts/specific_note.sh"):gsub("%s+$", "")
	--   vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
	--   vim.cmd("vertical resize 50")
	-- end, { desc = 'Open or create dated scratch file' })
	vim.keymap.set('n', '<leader>nn', function()
		vim.ui.input({ prompt = 'Note name: ' }, function(name)
			if not name or name == '' then
				return
			end

			local cmd = string.format(
				"%s %q",
				"~/Documents/dotfiles/scripts/specific_note.sh",
				name
			)

			local filepath = vim.fn.system(cmd):gsub("%s+$", "")
			if filepath == '' then
				return
			end

			vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
			vim.cmd("vertical resize 50")
		end)
	end, { desc = 'Open or create dated note' })


	-- vim.keymap.set('n', '<leader>nn', function()
		-- 	local filepath = vim.fn.system(
			-- 		"~/Documents/dotfiles/scripts/specific_note.sh"
			-- 	):gsub("%s+$", "")
			--
			-- 	if filepath == "" then
			-- 		return
			-- 	end
			--
			-- 	vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
			-- 	vim.cmd("vertical resize 50")
			-- end, { desc = 'Open or create dated note' })

			--
			vim.keymap.set('n', '<leader>nf', ':tabnew | Ex ~/Documents/Notes/<CR>', { desc = 'Search notes' })
