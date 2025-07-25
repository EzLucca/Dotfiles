
return{
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "marksman" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.marksman.setup({})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = 'Go to reference' })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, { desc = 'Symbols types' })
        end,
    }
}
