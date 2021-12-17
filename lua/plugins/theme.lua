local packer = require 'packer'
local use = packer.use

local M = {}

local function theme_cond(theme)
	return vim.fn.printf([[require('config').get('theme') == '%s']], theme)
end

local function theme_cmd(theme)
	return vim.fn.printf("vim.cmd('colorscheme %s')", theme)
end

local function use_theme(spec)
	local theme = spec.theme or spec.as or vim.fn.split(spec[0], "/")[1]
	
	if type(spec.config) == "string" then
		spec.config = vim.fn.join({ spec.config, theme_cmd(theme) }, "\n")
	elseif spec.config == nil then
		spec.config = theme_cmd(theme)
	end

	spec.cond = theme_cond(theme)

	use(spec)
end

local function register_plugins()
	use_theme {
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = [[vim.g.tokyonight_style = 'storm']],
	}

	use_theme {
		'~/Dev/nvim/catppuccin',
		--'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			require('catppuccin').setup({
				term_colors = true,
				integrations = {
					telescope = true,
					which_key = true,
					markdown = true,
					nvimtree = {
						enabled = true,
						show_root = true,
					},
				},
			})
			vim.cmd[[colorscheme catppuccin]]
		end
	}

	-- UI
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = false },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'catppuccin',
					extensions = { 'nvim-tree' },
				},
			}
		end,
		opt = false,
	}

	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('bufferline').setup {

			}
		end,
		opt = false,
	}
end

function M.setup()
	register_plugins()
end

return M
