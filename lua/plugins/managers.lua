local packer = require('packer')
local use = packer.use

local M = {}

local function register_plugins()
	use {
		'folke/which-key.nvim',
		config = function()
			local wk = require('which-key')
			wk.setup({})
			require('mappings').set_mappings_manager(wk)
		end,
		cond = [[require('config')['managers.mappings'] == 'which-key']],
	}
end

function M.setup()
	register_plugins()
end

return M
