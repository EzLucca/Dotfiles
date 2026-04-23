return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = { "BufReadPost", "BufNewFile" }, -- 👈 KEY CHANGE

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
          additional_vim_regex_highlighting = { "markdown" },
        },

        indent = { enable = false },
      })
    end
  }
}
