require('bootstrap').autoload {
	'bootstrap',
	'config',
	'editor',
	'plugins',
	'mappings',
	'editor_debug',
}

vim.cmd[[autocmd BufWritePost *.lua lua require'catppuccin'.load()]]
