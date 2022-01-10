-- TODO: Break this out into plugin-specific required files. Possibly we can allow the
-- definition of the prefixes here, then just have the plugin define the actual commands
-- to execute and the names.
local old = {
	{
		{
			-- Window 
			['<A-Left>' ] = { '<C-w>h', "Go to the left window"  },
			['<A-Right>'] = { '<C-w>l', "Go to the right window" },
			['<A-Up>'   ] = { '<C-w>k', "Go to the up window"    },
			['<A-Down>' ] = { '<C-w>j', "Go to the down window"  },

			-- Navigation
			['<C-N>'    ] = { function() require('nvim-tree').toggle() end, "Toggle NvimTree" },
		}, {
			mode = 'n'
		}
	},
	{ -- TODO: Enable mappings based on config. We need to only enable these if debug.reload is enabled
		{
			r = {
				-- Editor configuration
				name = "Neovim...",
				c = { function() require('editor_debug').reload_config() end, "Reload config" },
				l = { function() require('reload').reload() end, "Reload all" },
				e = { function() require('editor_debug').edit_config() end, "Edit config" },
				p = { function() require('editor_debug').reload_packer() end, "Plugin sync and reload" },
			},
			f = {
				-- Find (telescope)
				name = "Find...",
				f = { function() require('telescope.builtin').find_files() end, "Files" },
			}
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
	{
		-- Treesitter text objects
		-- TODO: Sync somehow with initialization
		{
			a = {
				name = '+around',
				f = 'a function',
				c = 'a call',
			},
			i = {
				name = '+inside',
				f = 'a function',
				c = 'a call',
				a = 'an argument',
			}
		}, {
			mode = 'o',
			prefix = '',
		},
	},
	{
		-- Treesitter swaps
		{
			['<ctrl-a>'] = {
				name = 'Swap argument...',
				h = 'to the left',
				l = 'to the right',
			},
		}, {
			mode = 'n',
			prefix = '',
		},
	},
}
