vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
--local use_rocks = require('packer').use_rocks
--local autocmd = require('util.autocmd')

-- TODO: For some bizarre reason, this decides to print the whole buffer to the
-- screen? I have no idea why this is happening and it's extremely annoying, so
-- I've disabled it for now.

--_G.plugins.packer = {}

--function _G.plugins.packer.reload()
	--vim.cmd [[PackerCompile]]
	--local file = vim.fn.stdpath('config')..'/lua/plugins/_packer.lua'
	--vim.cmd('luafile '..file)
	--vim.cmd [[PackerInstall]]
--end

--autocmd.autogroup('plugin_packer', {
	--{'BufWritePost', '_packer.lua', [[v:lua.plugins.packer.reload()]]}
--})

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

	use {
		'nvim-telescope/telescope.nvim',
		opt = true,
		requires = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' }
		}
	}
	use {
		'nvim-telescope/telescope-project.nvim',
		opt = true,
		requires = {
			{ 'nvim-telescope/telescope.nvim' }
		}
	}

	-- Util
	use { 'bfredl/nvim-luadev', opt = true }
	use { 'voldikss/vim-floaterm', opt = true }
	use { 'junegunn/vim-easy-align', opt = true }
	use { 'folke/which-key.nvim', opt = true }

	-- LSP
	use {
		'neoclide/coc.nvim',
		opt = true,
		branch = 'release',
	}
	use { 'preservim/nerdcommenter', opt = true }
	use {
		'SirVer/ultisnips',
		opt = true
	}
	--use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', opt = true }
	use { 'kylelaker/riscv.vim', opt = true }
	use { 'lervag/vimtex', opt = true }
	use { 'jwalton512/vim-blade', opt = true }

	-- Wiki
	use { 'vimwiki/vimwiki', opt = true, branch = 'dev' }

	-- Goyo
	use { 'junegunn/goyo.vim', opt = true }
end)
