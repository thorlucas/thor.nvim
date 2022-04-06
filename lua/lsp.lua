local M = {}
local lspconf = require('lspconfig')

M._autoload = function()
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	
	local luadev = require('lua-dev').setup({
		lspconfig = {
			capabilities = capabilities,
		},
	})

	lspconf.sumneko_lua.setup(luadev)

	lspconf.tsserver.setup({
		init_options = require('nvim-lsp-ts-utils').init_options,
		on_attach = function (client, bufnr)
			local ts_utils = require('nvim-lsp-ts-utils')
			ts_utils.setup({
				update_imports_on_move = true,
			})
			ts_utils.setup_client(client)
		end
	})

	lspconf.eslint.setup({})

	lspconf.tailwindcss.setup({})

	lspconf.hls.setup({})

	lspconf.rust_analyzer.setup({
		cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' },
	})

	--lspconf.theme_check.setup({})

	lspconf.pyright.setup({})

	lspconf.theme_check.setup({
		cmd = { 'shopify', 'theme', 'language-server' },
	})

	vim.diagnostic.config({
		virtual_text = {
			severity = vim.diagnostic.severity.ERROR,
		},
		signs = true,
		underline = false,
	})

	vim.cmd [[
		au CursorHold * lua vim.diagnostic.open_float(0, { scope = "cursor", focus = false })
	]]
	
	--require('editor_debug').debug_hihex()
	
	require('snippets')
end

return M
