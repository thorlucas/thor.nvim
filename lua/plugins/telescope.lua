--require'telescope'.load_extension('project')

require'telescope'.setup({
	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
		  }
		},
		file_ignore_patterns = {
			"node_modules/.*",
		},
	},
})

return {
	files = "<Cmd>lua require'telescope.builtin'.find_files()<CR>",
	buffers = "<Cmd>lua require'telescope.builtin'.buffers()<CR>",
	references = "<Cmd>lua require'telescope.builtin'.lsp_references()<CR>",
	definitions = "<Cmd>lua require'telescope.builtin'.lsp_definitions()<CR>",
	git_status = "<Cmd>lua require'telescope.builtin'.git_status()<CR>",
	--find_projects = "<Cmd>lua require'telescope'.extensions.project.project{ change_dir = true }<CR>",
}
