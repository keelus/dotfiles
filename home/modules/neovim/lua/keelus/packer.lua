vim.cmd [[packadd packer.nvim]]
	
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'linux-cultist/venv-selector.nvim',
		branch = "regexp"
	}

	use 'saecki/crates.nvim'

	use('lervag/vimtex')
	
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use("water-sucks/darkrose.nvim")

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

	use ({
		'nyoom-engineering/oxocarbon.nvim',
		config = function()
			vim.cmd('set background=dark')
			vim.cmd('colorscheme oxocarbon')
		end
	})

	use ({
		'navarasu/onedark.nvim',
		config = function()
			vim.cmd('set background=dark')
			vim.cmd('colorscheme onedark')
		end
	})

	use {
		"jesseleite/nvim-noirbuddy",
		requires = { "tjdevries/colorbuddy.nvim" }
	}

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
end)

