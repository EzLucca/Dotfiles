
vim.cmd("set softtabstop=4")
-- vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.opt.clipboard = "unnamedplus"

-- vim.o.autochdir = true
vim.o.mouse = "a"

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- vim.opt.splitright = true

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
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
-- vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
vim.g.netrw_sort_sequence = [[[\/]$,*,\.bak$,\.o$,\.h$,\.info$,\.swp$,\.obj$]]

-- Toggle netrw with <leader>fe
vim.keymap.set("n", "<leader>fe", ":Lex<CR>", { noremap = true, silent = true })

-- Auto open netrw if no file is given
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Explore")
    end
  end
})

-- open shell inside nvim
vim.o.shell = "/usr/bin/bash"
vim.keymap.set("n", "<leader>ov", ":vert term <CR>", { desc = 'Open vertical term' })
vim.keymap.set("n", "<leader>os", ":10sp | term <CR>", { desc = 'Open horizontal term' })
-- vim.keymap.set("n", "<leader>ox", ":!xterm -fa 'Monospace' -fs 12 -e bash<CR>", { desc = 'Open bash with font size 12' })

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

		-- Exit terminal mode
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

		-- Close terminal with <leader>q
		vim.keymap.set("t", "<leader>q", [[<C-\><C-n>:bd!<CR>]], opts)

		-- Navigate windows from terminal
		vim.keymap.set("t", "<leader>wh", [[<C-\><C-n><C-w>h]], opts)
		vim.keymap.set("t", "<leader>wj", [[<C-\><C-n><C-w>j]], opts)
		vim.keymap.set("t", "<leader>wk", [[<C-\><C-n><C-w>k]], opts)
		vim.keymap.set("t", "<leader>wl", [[<C-\><C-n><C-w>l]], opts)
	end,
})

-- Put this in your init.lua (or a separate lua file and require it)

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

-- Customize statusline (example)
-- %f = filename, %y = filetype, %m = modified, %r = readonly
-- %l = current line, %L = total lines, %p%% = percentage through file
vim.o.statusline = "%f %y %m %r %= %{%v:lua.function_size_status()%} Ln %l/%L Col %c %p%% "

vim.keymap.set("n", "<leader>ll", ":!ft_lock<CR>", { desc = '42 lock screen' })
