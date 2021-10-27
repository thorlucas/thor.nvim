--vim.g.nvim_tree_auto_open = 1
--vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'dist', '.DS_Store' }
--vim.g.nvim_tree_tab_open = 1
--vim.g.nvim_tree_git_hl = 1
--vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }
--vim.g.nvim_tree_disable_netrw = 0
--vim.g.nvim_tree_hijack_netrw = 0
--vim.g.nvim_tree_lsp_diagnostics = 1

require('nvim-tree').setup {
	open_on_setup = true,
	diagnostics = {
		enable = true,
		icons = {
			error = "*",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
		side = 'left',
	},
}

--require('util.map').keymap('n', '<C-n>', ':NvimTreeToggle<CR>')
