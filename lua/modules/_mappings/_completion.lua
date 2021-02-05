local M = {}
_G.thor.completion = {}

local map = require('util.map')
local us = require('plugins._lsp._ultisnips')
local coc = require('plugins._lsp._coc')

local function check_back_space()
	local col = vim.fn.col('.') - 1
	return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local function pumvisible()
	return vim.fn.pumvisible() == 1
end

local function pumselected()
	return vim.api.nvim_eval([[empty(v:completed_item)]]) == 0
end

function M.expand_or_jump(callback)
	_G.thor.completion._expand_or_jump = function()
		if pumselected() then
			return map.esc('<C-n>')
		elseif us.can_expand() then
			return us.expand()
		elseif pumvisible() then
			return map.esc('<C-n>')
		elseif us.can_jump() then
			return us.jump()
		elseif coc.can_jump() then
			-- TODO: Broken
			return coc.jump()
		else
			return callback
		end
	end

	return 'v:lua.thor.completion._expand_or_jump()', { expr = true }
end

function M.jump_back(callback)
	_G.thor.completion._jump_back = function()
		if pumvisible() then
			return map.esc('<C-p>')
		elseif us.can_jump_back() then
			return us.jump_back()
		elseif coc.can_jump_back() then
			return coc.jump_back()
		else
			return callback
		end
	end

	return 'v:lua.thor.completion._jump_back()', { expr = true }
end

function M.complete(callback)
	_G.thor.completion._complete = function()
		if pumvisible() then
			return coc.select_confirm()
		else
			return callback
		end
	end

	return 'v:lua.thor.completion._complete()', { expr = true }
end

return M
