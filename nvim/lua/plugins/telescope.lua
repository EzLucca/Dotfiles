return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/todo-comments.nvim"
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- fallback grep command if rg isn't available
          vimgrep_arguments = vim.fn.executable("rg") == 1
            and { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
            or { "grep", "-r", "--line-number", "--color=never" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        pickers = {
          find_files = {
            find_command = { "find", ".", "-type", "f" },
          },
        },
      })

      telescope.load_extension("ui-select")

      -- Key mappings
      vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope Help' })
      vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Telescope Keymaps' })
      vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope Files' })
      vim.keymap.set('n', '<leader>ts', builtin.builtin, { desc = 'Telescope Select Telescope' })
      vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = 'Telescope current Word' })

      if vim.fn.executable("rg") == 1 then
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope Grep (rg)' })
      else
        vim.keymap.set('n', '<leader>tg', function()
          require("telescope.builtin").find_files({ prompt_title = "Fallback: Find File" })
        end, { desc = 'Telescope Grep find_files' })
      end

      vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = 'Telescope Diagnostics' })
      vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = 'Telescope Resume' })
      vim.keymap.set('n', '<leader>to', builtin.oldfiles, { desc = 'Telescope Recent Files' })
      vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope Find buffers' })
      vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Telescope Find todos" })
    end,
  },
}
