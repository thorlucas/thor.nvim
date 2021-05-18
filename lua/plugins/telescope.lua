--require'telescope'.load_extension('project')

return {
	files = "<Cmd>lua require'telescope.builtin'.find_files()<CR>",
	buffers = "<Cmd>lua require'telescope.builtin'.buffers()<CR>",
	references = "<Cmd>lua require'telescope.builtin'.lsp_references()<CR>",
	definitions = "<Cmd>lua require'telescope.builtin'.lsp_definitions()<CR>",
	--find_projects = "<Cmd>lua require'telescope'.extensions.project.project{ change_dir = true }<CR>",
}
