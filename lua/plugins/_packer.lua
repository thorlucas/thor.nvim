vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer
	use { 'wbthomason/packer.nvim', opt = true }
	
	-- Ayu Color Scheme
	use { 'ayu-theme/ayu-vim', opt = true }
	
	-- File Tree
	use {
		'kyazdani42/nvim-tree.lua',
		opt = true,
		requires = {
			{ 'kyazdani42/nvim-web-devicons', opt = true }
		},
	}

	-- Util
	use { 'nvim-lua/plenary.nvim' }

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		opt = true,
		requires = {
			{ 'nvim-lua/lsp_extensions.nvim', opt = true},
			{ 'nvim-lua/completion-nvim', opt = true},
		}
	}
end)
