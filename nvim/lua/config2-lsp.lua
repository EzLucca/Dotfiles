-- config2-lsp.lua --------------------------------------------------------------

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
    },
})

local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_lsp.default_capabilities()

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    clangd = {},
    pyright = {},
}

for name, config in pairs(servers) do
    config.capabilities = capabilities
    lspconfig[name].setup(config)
end

-- Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

        local opts = function(desc)
            return { buffer = ev.buf, silent = true, desc = desc }
        end
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts("Hover documentation"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Find references"))

        vim.keymap.set({ "n", "v" }, "<leader>ca", function()
            require("tiny-code-action").code_action()
        end, opts("Code action"))
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts("Format buffer"))

        vim.keymap.set("n", "<leader>d", function()
            vim.diagnostic.open_float({
                border = "rounded",
            })
        end, opts("Show diagnostics float"))
    end,
})
