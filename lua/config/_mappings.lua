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
	{
		{
			name = "Neovim",
			r = {
				l = { '<Cmd>lua print("reloading")<CR>', "Reload Neovim" },
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
