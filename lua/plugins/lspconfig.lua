local lsp = require'lspconfig'

--vim.cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false}) ]]
--vim.cmd [[ autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } }]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require('rust-tools').setup {
	tools = {
		autoSetHints = true,
		inlay_hints = {
			show_parameter_hints = true,
		},
		hover_actions = {
			auto_focus = true,
		},
	},
	server = {
		cmd = { "/Users/thorcorreia/.rustup/toolchains/nightly-x86_64-apple-darwin/bin/rust-analyzer" },
		cmd_env = {
			RA_LOG = 'rust_analyzer=error',
		},
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
};

--lsp.rust_analyzer.setup {
	--on_attach = on_attach,
	--capabilities = capabilities,
	--settings = {
		--["rust-analyzer"] = {
			--assist = {
				--importMergeBehavior = "last",
				--importPrefix = "by_self",
			--},
			--cargo = {
				--loadOutDirsFromCheck = true
			--},
			--procMacro = {
				--enable = true
			--},
		--}
	--}
--}

local servers = { 'tsserver', 'tailwindcss', 'cssls', 'svelte' };

for _, serv in ipairs(servers) do
	lsp[serv].setup {
		capabilities = capabilities,
	}
end

local luadev = require('lua-dev').setup({})
lsp.sumneko_lua.setup(luadev)

vim.cmd[[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		--update_in_insert = false,
	}
)
