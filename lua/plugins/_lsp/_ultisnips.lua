local M = {}
_G.plugins.ultisnips = {}

local map = require('util.map')

-- TODO: We really want to actually move this into the function we put in _coc,
-- otherwise this takes precedence over the pum stuff
vim.g.UltiSnipsExpandTrigger = "<leader><Tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsJumpForwardTrigger = "<leader><Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<leader><S-Tab>"
vim.g.UltiSnipsRemoveSelectModeMappings = 0

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

function M.expand(context)
	return map.map_context("UltiSnips#ExpandSnippet()", context)
end

function M.jump(context)
	return map.map_context("UltiSnips#JumpForwards()", context)
end

function M.jump_back(context)
	return map.map_context("UltiSnips#JumpBackwards()", context)
end

return M
