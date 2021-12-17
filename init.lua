require('bootstrap').autoload {
	'bootstrap',
	'config',
	'editor',
	'plugins',
	'mappings',
	'editor_debug',
}

function TempReload()
	require'packer'.compile()
end

-- vim.cmd[[
-- 	autocmd BufWritePost *.lua lua TempReload()
-- ]]
-- 
-- vim.cmd[[
-- 	autocmd User PackerCompileDone require'nvim-tree'.open()
-- ]]
