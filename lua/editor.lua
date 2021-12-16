local M = {}

M.setup = function() 
	local opts = require('config')['vim']
	require('util').set_opt(opts)
end

M._autoload = function()
	M.setup()
end

return M
