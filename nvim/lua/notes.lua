
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

local function grep_all(patterns)
  if #patterns < 2 then
    print("Provide at least 2 patterns")
    return
  end

  -- Build PCRE lookahead regex
  local lookaheads = {}
  for _, pat in ipairs(patterns) do
    table.insert(lookaheads, "(?=.*" .. pat .. ")")
  end

  local regex = "(?s)" .. table.concat(lookaheads)

  local cmd = {
    "grep",
    "-rPl",
    regex,
    ".",
  }

  vim.fn.setqflist({}, " ", {
    title = "grep all: " .. table.concat(patterns, ", "),
    lines = vim.fn.systemlist(cmd),
  })

  vim.cmd("copen")
end

vim.api.nvim_create_user_command("GrepAll", function(opts)
  grep_all(opts.fargs)
end, { nargs = "+" })

-- Leader + p: Save, generate HTML with Pandoc, open in new browser window
vim.api.nvim_set_keymap(
  "n",
  "<leader>pp",
  [[
:w
:!pandoc % -s -o %:r.html --css=~/Documents/dotfiles/scripts/github-markdown.css --metadata title="%:t"
:!xdg-open %:r.html
]],
  { noremap = true, silent = true, expr = false }
)

vim.keymap.set("n", "<leader>pg", function()
  vim.cmd("vsplit")
  vim.cmd("terminal glow -s dark " .. vim.fn.expand("%:p"))
end, { silent = true })

