local M = {}

M._autoload = function()
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	
	local luadev = require('lua-dev').setup({
		lspconfig = {
			capabilities = capabilities,
		},
	})
	local lspconf = require('lspconfig')
	lspconf.sumneko_lua.setup(luadev)
	
	require('editor_debug').debug_hihex()
	
	require'snippets'
end

return M
