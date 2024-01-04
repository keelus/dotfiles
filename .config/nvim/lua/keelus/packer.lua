vim.cmd [[packadd packer.nvim]]
	
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
		vim.cmd('colorscheme rose-pine')
		end
	})

	use ({
		'NLKNguyen/papercolor-theme',
		config = function()
			vim.cmd('set background=dark')
			vim.cmd('colorscheme PaperColor')
		end
	})

	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use { 'folke/lsp-colors.nvim' }
	use { 'nvim-tree/nvim-tree.lua' } 
	use { 'hrsh7th/nvim-cmp' }
	use { 'nvim-tree/nvim-web-devicons'}
	use { 'nvim-lualine/lualine.nvim' }
	use { 'folke/trouble.nvim' }
	use { 'tpope/vim-fugitive' }
	use { 'andweeb/presence.nvim' }
	use { 'iamcco/markdown-preview.nvim' }
	use { 'ray-x/lsp_signature.nvim' }
	use { 'numToStr/Comment.nvim' }
	use { 'lukas-reineke/indent-blankline.nvim' }
	use { 'folke/tokyonight.nvim' }
	use { 'catppuccin/nvim' }
	use { 'ray-x/lsp_signature.nvim' }
end)

