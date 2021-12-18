require('bootstrap').autoload {
	'bootstrap',
	'config',
	'editor',
	'plugins',
	'mappings',
	'editor_debug',
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local luadev = require('lua-dev').setup({
	lspconfig = {
		capabilities = capabilities,
	},
})
local lspconf = require('lspconfig')
lspconf.sumneko_lua.setup(luadev)

require'snippets'

vim.api.nvim_set_keymap('n', '<leader>z', [[<Cmd>%source<CR><Cmd>vert new<CR><Cmd>lua hex_preview()<CR>i#10101]], { noremap = true })
print('asdf')

vim.cmd[[
	augroup reload_theme
	au!
	autocmd BufWritePost *.lua lua reload_catppuccin()
	augroup END
]]

-- 
-- vim.cmd[[
-- 	autocmd User PackerCompileDone require'nvim-tree'.open()
-- ]]
