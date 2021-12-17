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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local luadev = require('lua-dev').setup({
	lspconfig = {
		capabilities = capabilities,
	},
})
local lspconf = require('lspconfig')
lspconf.sumneko_lua.setup(luadev)

require'snippets'

-- vim.cmd[[
-- 	autocmd BufWritePost *.lua lua TempReload()
-- ]]
-- 
-- vim.cmd[[
-- 	autocmd User PackerCompileDone require'nvim-tree'.open()
-- ]]
