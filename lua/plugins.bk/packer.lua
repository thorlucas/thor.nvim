vim.cmd [[packadd packer.nvim]]

local use = require('packer').use

return require('packer').startup(function()
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Aesthetic
	--use 'shaunsingh/nord.nvim'
	use {
		'folke/tokyonight.nvim',
		config = function() vim.cmd[[colorscheme tokyonight]] end,
	}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
    use 'nvim-lua/lsp_extensions.nvim'
	use 'onsails/lspkind-nvim'
	use 'tami5/lspsaga.nvim'
	-- use 'ray-x/lsp_signature.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		'simrat39/rust-tools.nvim',
		requires = {
			{ 'mfussenegger/nvim-dap', },
			{ 'nvim-lua/plenary.nvim', },
		},
	}
	use 'stephpy/vim-yaml'
	use 'peterhoeg/vim-qml'	
	use 'jwalton512/vim-blade'
	use 'folke/lua-dev.nvim'
	-- Lua
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install',
	}

	
	-- Snippet
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use {
		'SirVer/ultisnips',
		setup = function()
			vim.g.UltiSnipsExpandTrigger = "<NUL>"
			vim.g.UltiSnipsListSnippets = "<NUL>"
			vim.g.UltiSnipsJumpForwardTrigger = "<NUL>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<NUL>"
			vim.g.UltiSnipsEditSplit = "tabdo"
		end,
		config = function()
			vim.g.UltiSnipsEnabled = true
		end,
		ft = { 'markdown' },
	}

	-- Editor
	use {
		'famiu/nvim-reload',
		requires = {'nvim-lua/plenary.nvim', opt = true}
	}
	use 'folke/which-key.nvim'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'preservim/nerdcommenter'
	use 'ggandor/lightspeed.nvim'
	

	-- File Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			{ 'kyazdani42/nvim-web-devicons', opt = true }
		},
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' }
		}
	}
	use { 'stevearc/dressing.nvim' }
	use {
		'nvim-telescope/telescope-ui-select.nvim',
		requires = 'nvim-telescope/telescope.nvim',
	}
	use 'tpope/vim-fugitive'

	-- Utility
	use 'jamessan/vim-gnupg'
	use 'github/copilot.vim'

	--use {
		--'nvim-telescope/telescope-project.nvim',
		--requires = { 'nvim-telescope/telescope.nvim' },
	--}



	--use { 'lervag/vimtex', opt = true }

	--use { 'vimwiki/vimwiki', opt = true, branch = 'dev' }
end)
