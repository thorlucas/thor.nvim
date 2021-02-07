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

function M.expand_or_jump(context, callback)
	if context == map.context.I then
		_G.thor.completion['_expand_or_jump_'..context] = function()
			if pumselected() then
				return map.esc('<C-n>')
			elseif us.can_expand() then
				return us.expand(context)
			elseif pumvisible() then
				return map.esc('<C-n>')
			elseif us.can_jump() then
				return us.jump(context)
			elseif coc.can_jump() then
				-- TODO: Doesn't work in select mode
				return coc.jump(context)
			else
				return callback
			end
		end
	else
		_G.thor.completion['_expand_or_jump_'..context] = function()
			if us.can_expand() then
				return us.expand(context)
			elseif us.can_jump() then
				return us.jump(context)
			else
				return callback
			end
		end
	end

	return 'v:lua.thor.completion._expand_or_jump_'..context..'()', { expr = true }
end

function M.jump_back(context, callback)
	_G.thor.completion['_jump_back_'..context] = function()
		if context == map.context.I then
			if pumvisible() then
				return map.esc('<C-p>')
			elseif us.can_jump_back() then
				return us.jump_back(context)
			elseif coc.can_jump_back() then
				return coc.jump_back(context)
			else
				return callback
			end
		else
			if us.can_jump_back() then
				return us.jump_back(context)
			else
				return callback
			end
		end
	end

	return 'v:lua.thor.completion._jump_back_'..context..'()', { expr = true }
end

function M.complete(context, callback)
	_G.thor.completion['_complete_'..context] = function()
		if pumvisible() then
			return coc.select_confirm(context)
		else
			return callback
		end
	end

	return 'v:lua.thor.completion._complete_'..context..'()', { expr = true }
end

return M
