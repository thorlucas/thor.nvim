local M = {}

M.reload_config = nil

M.define_debug_functions = function(on)
	if not on then return end

	function P(...)
		local args = {...}
		if #args > 1 then
			if type(args[1]) == 'string' then
				-- Format
				for i = 2, #args do
					args[i] = vim.inspect(args[i])
				end
				print(vim.fn.printf(unpack(args)))
			else
				for _, value in ipairs({...}) do	
					print(vim.inspect(value))
				end
			end
		else
			print(vim.inspect(args[1]))
		end
	end

	function R(...)
		return require(...)
	end
end

M.define_debug_reload = function(on)
	if not on then return end

	M.reload_config = function()
		require('plenary.reload').reload_module('config')
		require('config')
	end

	M.reload_all = function()
		local rl = require('plenary.reload')
		for k, p in ipairs(package.loaded) do
			rl.reload_module(k)
		end
		require('init')
	end

	M.reload_packer = function()
		local rl = require('plenary.reload')
		rl.reload_module('plugins')
		require('bootstrap').autoload({'plugins'})
		require('packer').sync()
	end
end

M.edit_config = function()
	vim.cmd('cd '..vim.fn.stdpath('config'))
	require('nvim-tree').open()
	vim.cmd('edit init.lua')
end

M._autoload = function()
	local config = require('config')
	config.attach('debug.functions', M.define_debug_functions) 
	config.attach('debug.reload', M.define_debug_reload)
end

M.debug_snippets = function()
	vim.cmd[[
		au BufWritePost */snippets/*.lua lua require('plenary.reload').reload_module('snippets') require('snippets').setup()
	]]
end

M.debug_hihex = function()
	vim.cmd[[
		au BufWritePost */hihex/*.lua lua require('plenary.reload').reload_module('hihex') require('hihex').setup()
	]]
end

return M
