
vim.cmd("set softtabstop=4")
vim.cmd("set splitbelow")
vim.opt.clipboard = "unnamedplus"

vim.o.mouse = "a"

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.winborder = "rounded"

-- Native search
vim.opt.path = { ".", "**" }
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append { "*/.git/*", "*/node_modules/*", "*.o", "*.obj", "*.pyc" }
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.opt.fillchars = {
	-- vert = '│', -- single line for vertical splits
	vert = ' ',      -- No character for vertical splits
	horiz = ' ',     -- No character for horizontal splits
	vertleft = ' ',  -- No character for left vertical corners
	vertright = ' ', -- No character for right vertical corners
	horizup = ' ',   -- No character for upper horizontal corners
	horizdown = ' ',  -- No character for bottom horizontal corners
	eob = ' '
}

-- Set the color of the separator line
-- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#000000', bold = true })

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

-- Set the tags option in Neovim (Lua config)
vim.opt.tags = './tags;,~/tags'

-- Netrw config (Lua equivalent)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0

-- open shell inside nvim
vim.o.shell = "/usr/bin/bash"
-- vim.keymap.set("n", "<leader>ox", ":!xterm -fa 'Monospace' -fs 12 -e bash<CR>", { desc = 'Open bash with font size 12' })


-- Customize statusline (example)
-- %f = filename, %y = filetype, %m = modified, %r = readonly
-- %l = current line, %L = total lines, %p%% = percentage through file
vim.o.statusline = "%f %y %m %r %= %{%v:lua.function_size_status()%} Ln %l/%L Col %c %p%% "

vim.keymap.set("n", "<leader>ll", ":!ft_lock<CR>", { desc = '42 lock screen' })


-- Define the session path
local session_path = vim.fn.expand("~") .. "/Documents/my_session.vim"

-- Save the session
vim.keymap.set("n", "<leader>ss", function()
  vim.cmd("mksession! " .. session_path)
  vim.notify("Session saved!", vim.log.levels.INFO)
end, { desc = "Save session" })

-- Load the session
vim.keymap.set("n", "<leader>sl", function()
  if vim.fn.filereadable(session_path) == 1 then
    vim.cmd("source " .. session_path)
    vim.notify("Session loaded!", vim.log.levels.INFO)
  else
    vim.notify("No saved session found.", vim.log.levels.WARN)
  end
end, { desc = "Load session" })

