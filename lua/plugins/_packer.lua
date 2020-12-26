vim.cmd [[packadd packer.nvim]]
local use = require('packer').use

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
	use { 'nvim-lua/plenary.nvim', opt = true }
	use { 'bfredl/nvim-luadev', opt = true }

	-- LSP
	use {
		'neoclide/coc.nvim',
		opt = true,
		branch = 'release',
	}
end)
