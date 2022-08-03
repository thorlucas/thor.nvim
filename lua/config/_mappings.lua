-- TODO: Break this out into plugin-specific required files. Possibly we can allow the
-- definition of the prefixes here, then just have the plugin define the actual commands
-- to execute and the names.
return {
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
				l = { function() require('editor_debug').reload_all() end, "Reload all" },
				e = { function() require('editor_debug').edit_config() end, "Edit config" },
				p = { function() require('editor_debug').reload_packer() end, "Plugin sync and reload" },
			},
			f = {
				-- Find (telescope)
				name = "Find...",
				f = { function() require('telescope.builtin').find_files() end, "Files" },
			},
			q = {
				-- LSP
				name = "LSP...",
				r = { function () vim.lsp.buf.rename() end, "Rename" },
				f = { function () vim.lsp.buf.code_action() end, "Quickfix" },
				d = { function () vim.lsp.buf.definition() end, "Definition" },
				m = { function () require('nvim-lsp-ts-utils').rename_file() end, "[TS] Rename file" },
			},
			c = {
				-- Commenting
				name = "Comment...",
				['<Space>'] = { function () require('Comment.api').toggle_current_blockwise() end, "Toggle block" },
				c = { function () require('Comment.api').toggle_current_linewise() end, "Toggle line" },
			},
			['<Tab>'] = {
				-- Tab utils
				name = "Tab...",
				['2'] = { function () vim.cmd [[set ts=2]] vim.cmd [[%retab!]] vim.cmd [[set ts=4]] end, "Convert from 2 spaces" },
			}

		}, {
			mode = 'n',
			prefix = '<leader>'
		}
	},
	{
		{
			c = {
				-- Commenting
				name = "Comment...",
				['<Space>'] = { function () require('Comment.api').toggle_blockwise_op(vim.fn.visualmode()) end, "Toggle block" },
			},
		}, {
			mode = 'x',
			prefix = '<leader>',
		}
	},
	{
		{
			['jk'] = { '<Esc>', "Exit insert mode" },
		}, {
			mode = 'i',
		}
	},
	{
		{
			['jk'] = { '<Esc>', "Exit visual mode" },
		}, {
			mode = 'v',
		}
	},
	-- Doesn't work for some reason
	-- {
	-- 	{
	-- 		['<Esc>'] = { [[<C-\><C-n>]], "Exit terminal mode" },
	-- 	}, {
	-- 		mode = 't',
	-- 		prefix = '',
	-- 	},
	-- },
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
