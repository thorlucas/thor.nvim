_G.test_handler = function(err, result, ctx, config) 
	if err then
		vim.notify(vim.inspect(err), 4)
		return
	end
	print(vim.inspect(result))
	print(vim.inspect(ctx))
end

_G.test_set_mark = function()
	local pos = vim.lsp.util.make_position_params()
	print(vim.inspect(pos))
	vim.lsp.buf_request(0, 'textDocument/definition', pos, _G.test_handler)

--	local ns = vim.api.nvim_get_namespaces()['test'] or vim.api.nvim_create_namespace('test')
--	vim.cmd('echo '..ns)
--
--	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--	row = row - 1
--	local m = vim.api.nvim_buf_set_extmark(0, ns, row, col, {
--		virt_text = {{'test!', 'GlyphPalette1'}},
--		virt_text_pos = 'overlay'
--	})
end

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>lua _G.test_set_mark()<CR>', {
	noremap = true,
	silent = true,
})
