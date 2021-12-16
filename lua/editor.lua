---The editor module loads vim configuration, like options, generic autocommands, and
-- other commands (like enabling syntax highlighting, etc).

local M = {}

M.load_opts = function(opts)
	print("setting opts")
	require('util').set_opts(
		opts
	)
end

M.load_cmds = function(cmds)
	print("setting cmds")
	require('util').run_cmds(
		cmds
	)
end

M.setup = function() 
	require('config').attach('vim.opts', M.load_opts)
	require('config').attach('vim.cmds', M.load_cmds)
end

M._autoload = function()
	M.setup()
end

return M
