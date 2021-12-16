---The editor module loads vim configuration, like options, generic autocommands, and
-- other commands (like enabling syntax highlighting, etc).

local M = {}

M.load_opts = function()
	require('util').set_opts(
		require('config')['vim.opts']
	)
end

M.load_cmds = function()
	require('util').run_cmds(
		require('config')['vim.cmds']
	)
end

M.setup = function() 
	-- TODO: Subscribe to config for option changes
	M.load_opts()
	M.load_cmds()
end

M._autoload = function()
	M.setup()
end

return M
