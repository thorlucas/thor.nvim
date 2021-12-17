local M = {}

M.setup = function()
	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					['<esc>'] = require('telescope.actions').close,
				},
			},
		},
	}
end

M.use = function()
	require('packer').use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			opt = false,
		},
		config = M.setup,
		opt = false,
	}
end

return M
