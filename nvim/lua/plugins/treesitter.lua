--
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function ()
--       local config = require("nvim-treesitter.configs")
--       config.setup({
--         auto_install = true,
--         highlight = { enable = true },
--         indent = { enable = false},
--       })
--     end
--   }
-- }
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local config = require("nvim-treesitter.configs")

      config.setup({
        ensure_installed = {
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
        },

        auto_install = true,

        highlight = {
          enable = true,

          -- important for markdown
          additional_vim_regex_highlighting = { "markdown" },
        },

        indent = { enable = false },
      })
    end
  }
}
