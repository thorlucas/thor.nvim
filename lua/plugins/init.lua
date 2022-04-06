_G._plugins = _G._plugins or {
	needs_sync = false,
	loaded = false,
}
_G.packer_plugins = _G.packer_plugins or {}

local M = {}
local packer = nil

local function init()
	local err = nil
	packer, err = pcall(function()
		return require('packer')
	end)

	if err then
		_G._plugins.needs_sync = require('bootstrap').packer()
		packer = require('packer')
	end
end

local function register_plugins()
	local use = packer.use
	packer.reset()

	-- Package manager
	use { 'wbthomason/packer.nvim', opt = false }

	-- Utility
	use { 'nvim-lua/plenary.nvim', opt = false }

	-- Mine
	-- use {
	-- 	'~/Dev/nvim/reload.nvim',
	-- 	opt = false,
	-- 	config = function()
	-- 		require('reload').pre_reload_hook = function()
	-- 			_G.config = nil
	-- 			_G._plugins = nil
	-- 		end
	-- 	end,
	-- }


	-- use {
	-- 	'~/Dev/nvim/hihex.nvim',
	-- 	as = 'hihex',
	-- 	opt = false,
	-- 	config = function()
	-- 		return require('hihex').setup()
	-- 	end,
	-- }

	-- Appearance
	require 'plugins.theme'.setup()

	use {
		'stevearc/dressing.nvim',
		config = function ()
			require('dressing').setup({
				select = {
					backend = { "telescope", "nui" },
					telescope = {
						theme = "cursor",
					},
				},
			});
		end,
		opt = false,
	}

	-- Managers (e.g. keymap managers)
	require 'plugins.managers'.setup()

	-- Navigation
	require('plugins.plugin.telescope').use()
	use {
		disable = true,
		'ms-jpq/chadtree',
		branch = 'chad',
		run = 'python3 -m chadtree deps',
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			{ 'kyazdani42/nvim-web-devicons', opt = false },
		},
		config = function()
			vim.g.nvim_tree_highlight_opened_files = 1
			require('nvim-tree').setup {
				hijack_cursor = true,
				update_cwd = true,
				diagnostics = {
					enable = true,
				},
				open_on_setup = true,
			}
		end,
		opt = false,
	}

	use {
		'neovim/nvim-lspconfig',
		opt = false,
	}


	use {
		'folke/lua-dev.nvim',
		opt = false,
	}

	use {
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		opt = false,
		requires = { 'nvim-lua/plenary.nvim' },
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({
				mappings = {
					basic = false,
					extra = false,
					extended = false,
				},
			})
		end,
		opt = false,
	}

	require('plugins.plugin.cmp').use()

	use {
		'rafcamlet/nvim-luapad',
		config = function()
			require('luapad').setup({})
		end,
		opt = false,
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = {
					enable = true,
					disable = { 'rust' },
				},
				autotag = {
					enable = true,
					filetypes = { 
						'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'rescript'
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = false,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.outer',
							--['ac'] = '@class.outer',
							--['ic'] = '@class.outer',
							['ac'] = '@call.outer',
							['ic'] = '@call.inner',
							['ia'] = '@parameter.inner',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			}
		end,
		run = [[:TSUpdate]],
		opt = false,
	}

	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		requires = {
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		opt = false,
	}

	use {
		'windwp/nvim-autopairs',
		opt = false,
		config = function ()
			require('nvim-autopairs').setup({})
		end
	}

	use {
		'windwp/nvim-ts-autotag',
		--opt = false,
		disable = true,
		config = function ()
			require('nvim-ts-autotag').setup()
		end
	}
	
	-- TODO: Temporary
	-- Register listeners
	require('config').attach('theme', function(theme) 
		if _G.packer_plugins[theme] and not _G.packer_plugins[theme].loaded then
			-- TODO: We could just load the new theme and the old theme
			-- But we'd need the config to also pass in the old value
			packer.compile()
		end
	end)
end

function M.setup()
	init()

	local config = require('config')['modules.plugins']

	-- Initialize packer
	packer.init({
		opt_default = config.opt_default,
		display = {
			non_interactive = not config.display,
		},
	})

	-- Register all of the plugins
	register_plugins()

	-- Sync when bootstrapped
	if _G._plugins.needs_sync or _G._plugins.debug then
		packer.sync()
	end

	_G._plugins.loaded = true
end

M._defaults = {
	display = true,
	opt_default = true,
	auto_clean = false,
}

M._autoload = function()
	require('plugins').setup()
end

return M
