-- lsp-config.lua --------------------------------------------------------------

-- Create augroup (FIX: was missing before)
local augroup = vim.api.nvim_create_augroup("LspConfig", { clear = true })

-- LSP settings
local function setup_lsp()
  -- Show diagnostic signs in the gutter
  local signs = {
    Error = "\u{f06a} ", -- nf-fa-exclamation_circle
    Warn = "\u{f071} ",  -- nf-fa-exclamation_triangle
    Hint = "\u{f0eb} ",  -- nf-fa-lightbulb_o
    Info = "\u{f05a} "   -- nf-fa-info_circle
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Diagnostic configuration
  vim.diagnostic.config({
    virtual_text = {
      prefix = '●',
      spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

  -- LSP keymaps (set when LSP attaches)
  vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup,
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  -- Floating window borders
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

-- LSP diagnostic keymaps (always available)
vim.keymap.set('n', '<A-d>p', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<A-d>n', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

setup_lsp()

-- START LSP SERVERS (THIS WAS MISSING) -----------------------------------------

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "python", "javascript", "typescript" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    local servers = {
      lua = { "lua-language-server" },
      python = { "pyright-langserver", "--stdio" },
      javascript = { "typescript-language-server", "--stdio" },
      typescript = { "typescript-language-server", "--stdio" },
    }

    local cmd = servers[ft]
    if not cmd then return end

    vim.lsp.start({
      name = ft,
      cmd = cmd,
      root_dir = vim.fs.root(args.buf, {
        ".git",
        "package.json",
        "pyproject.toml",
        ".luarc.json"
      }),
    })
  end,
})
