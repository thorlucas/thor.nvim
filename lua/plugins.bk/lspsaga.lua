require'lspsaga'.init_lsp_saga({
	border_style = 'round',
	code_action_keys = {
		quit = '<Esc>',
	},
	rename_action_keys = {
		quit = '<Esc>',
	},
})

-- FIXME: This doesn't work for some reason
-- It works when I manually run this after vim has launched,
-- but it doesn't work when I put it here.
vim.cmd [[ hi! link LspFloatWinNormal Normal ]]
