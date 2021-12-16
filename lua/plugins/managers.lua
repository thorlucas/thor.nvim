local packer = require('packer')
local use = packer.use

local M = {}

local function register_plugins()
	use {
		'folke/which-key.nvim',
		config = function()
			local wk = require('which-key')
			wk.setup({})
			require('keymap').set_keymap_manager(wk)
		end,
		cond = [[require('config')['managers.keymap'] == 'which-key']],
	}
end

function M.setup()
	register_plugins()
end

return M
