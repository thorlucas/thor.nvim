local packer = require 'packer'
local use = packer.use

local M = {}

local function theme_cond(theme)
	return vim.fn.printf([[require('config').theme == '%s']], theme)
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
		'catppuccin/nvim',
		as = 'catppuccin',
		config = [[require('catppuccin').setup()]],
	}
end

function M.setup()
	register_plugins()
end

return M
