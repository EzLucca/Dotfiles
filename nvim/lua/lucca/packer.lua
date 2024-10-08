-- This file can be loaded by caling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'AlexvZyl/nordic.nvim',
		as = 'nordic',
		config = function()
			vim.cmd('colorscheme nordic')
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,}
		use("nvim-treesitter/playground")
		use("theprimeagen/harpoon")
		use("mbbill/undotree")
		use("tpope/vim-fugitive")
        use(
        { "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			requires = {
				--- Uncomment the two plugins below if you want to manage the language servers from neovim
				-- {'williamboman/mason.nvim'},
				-- {'williamboman/mason-lspconfig.nvim'},

				-- LSP Support
				{'neovim/nvim-lspconfig'},
				-- Autocompletion
				{'hrsh7th/nvim-cmp'},
				{'hrsh7th/cmp-nvim-lsp'},
				{'L3MON4D3/LuaSnip'},
			}
		}
		use { "williamboman/mason.nvim" }
		use { "williamboman/mason-lspconfig.nvim" }
	end)




