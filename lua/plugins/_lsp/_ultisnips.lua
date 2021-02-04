local M = {}
_G.plugins.ultisnips = {}

-- TODO: We really want to actually move this into the function we put in _coc,
-- otherwise this takes precedence over the pum stuff
vim.g.UltiSnipsExpandTrigger = "<NUL>"
--vim.g.UltiSnipsJumpForwardTrigger = "<NUL>"
--vim.g.UltiSnipsJumpBackwardTrigger = "<NUL>"

vim.cmd [[packadd ultisnips]]

function M.expand_or_jump()
	vim.cmd [[call UltiSnips#ExpandSnippetOrJump()]]
end

M.FAILED = 0
M.EXPANDED = 1
M.JUMPED = 2

function M.expand_or_jump_result()
	return vim.g.ulti_expand_or_jump_res
end

return M
