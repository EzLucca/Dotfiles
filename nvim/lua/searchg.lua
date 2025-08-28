
local builtin = require("telescope.builtin")

-- Grep current word under cursor and open Telescope
vim.keymap.set("n", "<leader>og", function()
    local word = vim.fn.expand("<cword>")
    -- Use Telescope grep_string for current word
    builtin.grep_string({ search = word })
end, { desc = "Grep current word in Telescope" })

-- Close Telescope picker
-- (Telescope closes itself, no need for manual cclose)
vim.keymap.set("n", "<leader>qg", function()
    -- Optional: do nothing or clear Telescope history
    -- Telescope automatically closes when you select or press <Esc>
end, { desc = "Close Telescope (picker handles itself)" })

-- vim.keymap.set("n", "<leader>og", function()
-- 	local word = vim.fn.expand("<cword>")
-- 	vim.cmd("silent! grep! -rn " .. vim.fn.shellescape(word) .. " **/*")
-- 	vim.cmd("copen")
-- end, { desc = "Grep current word and open quickfix" })
-- vim.keymap.set("n", "<leader>qg", function()
-- 	vim.fn.setqflist({})
-- 	vim.cmd("cclose")
-- end, { desc = "Clear and close quickfix" })
