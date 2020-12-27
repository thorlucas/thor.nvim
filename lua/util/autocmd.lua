local M = {}

-- TODO: I'd like to allow callbacks as well. I think in order to properly do
-- callbacks we need to set a global function so that it call be called with
-- v:lua.thor.some_unique_callback_identifier?
-- Or maybe we just wait until autogroups are fully supported by nvim

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
