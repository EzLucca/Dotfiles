return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    local home = vim.fn.expand("~/Documents") -- change to your notes dir

    require('telekasten').setup({
      home = home,
      auto_set_filetype = true,
      dailies = home .. "/Daily",
      templates = home .. "/templates",
      -- add more options here if needed
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<leader>zn', "<cmd>lua require('telekasten').new_note()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<leader>zf', "<cmd>lua require('telekasten').find_notes()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<leader>zd', "<cmd>lua require('telekasten').find_daily_notes()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<leader>zg', "<cmd>lua require('telekasten').search_notes()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<leader>zb', "<cmd>lua require('telekasten').show_backlinks()<CR>", opts)

    vim.api.nvim_set_keymap('n', '<Tab>', 'za', { noremap = true, silent = true })
  end,
}

