local M = {}

M.context = {
	I = 'i',
	S = 's',
	X = 'x',
	V = 'v',
	N = 'n',
}

-- From: https://github.com/kristijanhusak/neovim-config
function M.keymap(mode, lhs, rhs, opts)
	return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
		nowait = true,
		silent = true,
		noremap = true,
	}))
end

function M.buf_keymap(buf, mode, lhs, rhs, opts)
	return vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
		nowait = true,
		silent = true,
		noremap = true,
	}))
end

function M.unmap(mode, lhs)
	return vim.api.nvim_del_keymap(mode, lhs)
end

function M.esc(cmd)
	return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

function M.map_context(func, context)
	if context == M.context.I then
		return M.esc([[<C-R>=]]..func..[[<CR>]])
	elseif context == M.context.N then
		return M.esc([[:call ]]..func..[[<CR>]])
	else -- V, S, or X
		return M.esc([[<Esc>:call ]]..func..[[<CR>]])
	end
end

return M
