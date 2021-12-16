local M = {}

M.define_debug_functions = function()
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

M._autoload = function()
	require('config').attach('debug', function(debug)
		if debug then
			M.define_debug_functions()
		end
	end)
end

return M
