local cfg = require("which-key")
cfg.setup {}

cfg.register({
	r = {
		name = "reload",
		l = { "<Cmd>Reload<CR>", "Reload config" },
		r = { "<Cmd>Restart<CR>", "Restart neovim" },
	},
	c = {
		name = "comment",
		["<Space>"] = { "<plug>NERDCommenterToggle", "Toggle comment", noremap = false },
	},
	q = {
		name = "lsp",
		f = { "<Cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code action" },
	},
}, { prefix = "<leader>", mode = "n" })

cfg.register({
	c = {
		name = "comment",
		["<Space>"] = { "<plug>NERDCommenterToggle", "Toggle comment", noremap = false },
	}
}, { prefix = "<leader>", mode = "v" })

-- nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
-- nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
-- nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
-- nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
-- nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
-- nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
-- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

-- nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

-- nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

