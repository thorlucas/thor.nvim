local M = {}

function M.autogroup(group_name, definition)
	vim.cmd('augroup '..group_name)
	vim.cmd('autocmd!')
	for _, def in ipairs(definition) do
		local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
		vim.cmd(command)
	end
	vim.cmd('augroup END')
end


function M.autogroups(definitions)
	for group_name, definition in pairs(definitions) do
		M.autogroup(group_name, definition)
	end
end

return M
