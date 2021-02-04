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

function M.expand_or_jump(callback)
	_G.thor.completion._rest_complete = function()
		if us.expand_or_jump_result() == us.FAILED then
			-- If no UltiSnips expanded
			if pumvisible() then
				-- Navigate the pum
				return map.esc('<C-n>')
			elseif coc.can_jump() then
				-- TODO: Why in the everliving fuck does this not work?
				return map.esc('<C-j>')
			else
				-- Otherwise, do the callback
				return callback
			end
		else
			-- If UltiSnips expanded, do nothing
			return ""
		end
	end

	_G.thor.completion._expand_or_jump = function()
		-- Try the UltiSnips
		us.expand_or_jump()
		return ""
	end

	local us_complete = '<C-R>=v:lua.thor.completion._expand_or_jump()<CR>'
	local rest_complete = '<Thor>(_rest_complete)'

	map.keymap('i', rest_complete, 'v:lua.thor.completion._rest_complete()', { expr = true })
	return us_complete..rest_complete, { noremap = false }
end

function M.jump_back(callback)
	_G.thor.completion._jump_back = function()
		if pumvisible() then
			return map.esc('<C-p>')
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
