local cfg = require("which-key")
cfg.setup {}

cfg.register({
	r = {
		name = "Reload",
		l = { "<Cmd>Reload<CR>", "Reload config" },
		r = { "<Cmd>Restart<CR>", "Restart neovim" },
	},
	c = {
		name = "Comment",
		["<Space>"] = { "<plug>NERDCommenterToggle", "Toggle comment", noremap = false },
	},
	q = {
		name = "LSP",
		f = { require('lspsaga.codeaction').code_action, "Code action" },
		ff = { "<Cmd>TroubleToggle quickfix<CR>", "Code actions list" },
		x = { "<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>", "Diagnostics" },
		x = { require'plugins.telescope'.workspace_diagnostics, "Workspace Diagnostics" },
		r = { function() require('lspsaga.rename').rename() end, "Rename" },
		r = { vim.lsp.buf.rename, "Rename" },
		s = { require('lspsaga.signaturehelp').signature_help, "Signature help" },
		h = { require('lspsaga.hover').render_hover_doc, "Documentation" },
		p = { require('lspsaga.provider').preview_definition, "Definition" },
		d = { require('lspsaga.provider').lsp_finder },
		q = { require('plugins.copilot').toggle_copilot, "Toggle copilot" },

		-- TODO: Only enable when filetype is rust using some sort of autocmd
		t = { require('rust-tools.runnables').runnables, "[Rust] runnables" },
		g = { require('rust-tools.debuggables').debuggables, "[Rust] debuggables" },
	},
	f = {
		name = "Find",
		f = { require'plugins.telescope'.files, "Find files" },
		b = { require'plugins.telescope'.buffers, "Find buffers" },
		r = { require'plugins.telescope'.references, "Find references" },
		d = { require'plugins.telescope'.definitions, "Find definitions" },
	},
	g = {
		name = "Git",
		a = { "<Cmd>Git add %<CR>", "Add current" },
		d = { "<Cmd>Gdiffsplit<CR>", "Diff split" },
		c = { "<Cmd>Git commit<CR>", "Commit" },
		s = { require'plugins.telescope'.git_status, "List status" },
		l = { require'plugins.telescope'.git_status, "List commits" },
		b = { require'plugins.telescope'.git_status, "List branches" },
	},
	['<Tab>'] = {
		name = "Tab utilities",
		-- TODO: Make this use the default tab config rather than hardcoding to 4
		[2] = {
			"<Cmd>set ts=2<CR><Cmd>%retab!<CR><Cmd>set ts=4<CR>",
			"Convert 2 spaces to tabs",
		},
	},
}, { prefix = "<leader>", mode = "n" })

cfg.register({
	c = {
		name = "comment",
		["<Space>"] = { "<plug>NERDCommenterToggle", "Toggle comment", noremap = false },
	}
}, { prefix = "<leader>", mode = "v" })

vim.cmd[[nmap <silent> <expr> <CR> &diff ? 'do' : '<CR>']]
vim.cmd[[nmap <silent> <expr> <Tab> &diff ? ']c' : '<Tab>']]
vim.cmd[[nmap <silent> <expr> <S-Tab> &diff ? '[c' : '<S-Tab>']]

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

