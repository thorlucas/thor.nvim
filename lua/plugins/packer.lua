vim.cmd [[packadd packer.nvim]]

local use = require('packer').use

return require('packer').startup(function()
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Aesthetic
	use 'shaunsingh/nord.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
    use 'nvim-lua/lsp_extensions.nvim'
	use 'onsails/lspkind-nvim'
	use 'tami5/lspsaga.nvim'
	-- use 'ray-x/lsp_signature.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'simrat39/rust-tools.nvim'
	use 'stephpy/vim-yaml'
	use 'peterhoeg/vim-qml'
	
	use 'jwalton512/vim-blade'
	
	-- Snippet
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'

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

	-- Utility
	use 'jamessan/vim-gnupg'

	--use {
		--'nvim-telescope/telescope-project.nvim',
		--requires = { 'nvim-telescope/telescope.nvim' },
	--}



	--use { 'lervag/vimtex', opt = true }

	--use { 'vimwiki/vimwiki', opt = true, branch = 'dev' }
end)
