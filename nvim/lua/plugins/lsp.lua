return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',

    -- 👇 Load ONLY when opening a file
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      -- Mason (only when you explicitly open it)
      {
        'mason-org/mason.nvim',
        cmd = "Mason",
        opts = {},
      },

      -- Bridge between mason and lspconfig
      {
        'mason-org/mason-lspconfig.nvim',
        event = { "BufReadPre", "BufNewFile" },
      },

      -- Tool installer (don’t run at startup)
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        event = "VeryLazy",
      },

      -- LSP UI (only when LSP attaches)
      {
        'j-hui/fidget.nvim',
        event = "LspAttach",
        opts = {},
      },

      -- Completion (only when typing)
      {
        'saghen/blink.cmp',
        event = "InsertEnter",
      },
    },

    config = function()
      -- Enable faster Lua module loading
      vim.loader.enable()

      -- LSP attach keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Example mapping (you can add more)
          -- map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        end,
      })

      -- Diagnostics config
      vim.diagnostic.config {
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'if_many',
          header = false,
          prefix = "",
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
        underline = {},
        signs = vim.g.have_nerd_font and {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        } or {},
        virtual_text = false,
      }

      -- Capabilities (safe lazy usage)
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = vim.tbl_deep_extend(
          "force",
          capabilities,
          blink.get_lsp_capabilities()
        )
      end

      -- Servers
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      -- Ensure tools are installed (lazy)
      vim.defer_fn(function()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, { 'stylua' })

        require('mason-tool-installer').setup {
          ensure_installed = ensure_installed,
        }
      end, 100)

      -- Setup mason-lspconfig
      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend(
              'force',
              {},
              capabilities,
              server.capabilities or {}
            )
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
