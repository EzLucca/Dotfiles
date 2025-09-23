-- return {
-- 	{
-- 		"nvim-telescope/telescope-ui-select.nvim",
-- 	},
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.5",
-- 		dependencies = { "nvim-lua/plenary.nvim",
-- 		"folke/todo-comments.nvim" },
-- 		config = function()
-- 			require("telescope").setup({
-- 				extensions = {
-- 					["ui-select"] = {
-- 						require("telescope.themes").get_dropdown({}),
-- 					},
-- 				},
-- 			})
-- 			local builtin = require("telescope.builtin")
-- 			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
-- 			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
-- 			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
-- 			vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
-- 			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- 			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
-- 			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- 			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- 			vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
-- 			vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- 			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
-- 			require("telescope").load_extension("ui-select")
-- 		end,
-- 	},
-- }
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
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

      if vim.fn.executable("rg") == 1 then
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep (rg)' })
      else
        vim.keymap.set('n', '<leader>sg', function()
          require("telescope.builtin").find_files({ prompt_title = "Fallback: Find File" })
        end, { desc = '[S]earch [G]rep fallback to find_files' })
      end

      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files' })
      vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    end,
  },
}
