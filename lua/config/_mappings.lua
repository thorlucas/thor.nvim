return {
	{
		{
			['<A-Left>' ] = { '<C-w>h', "Go to the left window"  },
			['<A-Right>'] = { '<C-w>l', "Go to the right window" },
			['<A-Up>'   ] = { '<C-w>k', "Go to the up window"    },
			['<A-Down>' ] = { '<C-w>j', "Go to the down window"  },
		}, {
			mode = 'n'
		}
	},
	{ -- TODO: Enable mappings based on config. We need to only enable these if debug.reload is enabled
		{
			name = "Neovim",
			r = {
				c = { '<Cmd>lua require("editor_debug").reload_config()<CR>', "Reload config" },
				l = { '<Cmd>lua require("editor_debug").reload_all()<CR>', "Reload all" },
			},
		}, {
			mode = 'n',
			prefix = '<leader>'
		}
	},
	{
		{
			['jk'] = { '<Esc>', "Exit insert mode" },
		}, {
			mode = 'i'
		}
	},
	{
		{
			['jk'] = { '<Esc>', "Exit visual mode" },
		}, {
			mode = 'v'
		}
	},
}
