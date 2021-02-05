local M = {}
_G.plugins.ultisnips = {}

local map = require('util.map')

-- TODO: We really want to actually move this into the function we put in _coc,
-- otherwise this takes precedence over the pum stuff
vim.g.UltiSnipsExpandTrigger = "<NUL>"
--vim.g.UltiSnipsJumpForwardTrigger = "<NUL>"
--vim.g.UltiSnipsJumpBackwardTrigger = "<NUL>"

vim.cmd [[packadd ultisnips]]

function M.can_expand()
	return vim.fn['UltiSnips#CanExpandSnippet']() == 1
end

function M.can_jump()
	return vim.fn['UltiSnips#CanJumpForwards']() == 1
end

function M.can_jump_back()
	return vim.fn['UltiSnips#CanJumpBackwards']() == 1
end

function M.expand()
	return map.esc([[<C-R>=UltiSnips#ExpandSnippet()<CR>]])
end

function M.jump()
	return map.esc([[<C-R>=UltiSnips#JumpForwards()<CR>]])
end

function M.jump_back()
	return map.esc([[<C-R>=UltiSnips#JumpBackwards()<CR>]])
end

return M
