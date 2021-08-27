local lsp = require'lspconfig'

vim.cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false}) ]]
vim.cmd [[ autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } }]]

local on_attach = function(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

lsp.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			},
		}
	}
}

lsp.tsserver.setup {
	on_attach = on_attach,
}

lsp.pyright.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	}
)
