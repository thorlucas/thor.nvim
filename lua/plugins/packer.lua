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
	--use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-lua/lsp_extensions.nvim'
	-- use 'simrat39/rust-tools.nvim'
	

	-- File Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			{ 'kyazdani42/nvim-web-devicons', opt = true }
		},
	}

	--use {
		--'nvim-telescope/telescope.nvim',
		--opt = true,
		--requires = {
			--{ 'nvim-lua/popup.nvim' },
			--{ 'nvim-lua/plenary.nvim' }
		--}
	--}

	--use {
		--'nvim-telescope/telescope-project.nvim',
		--opt = true,
		--requires = {
			--{ 'nvim-telescope/telescope.nvim' }
		--}
	--}

	--use { 'folke/which-key.nvim', opt = true }


	--use { 'lervag/vimtex', opt = true }

	--use { 'vimwiki/vimwiki', opt = true, branch = 'dev' }
end)
