_G._plugins = require('util').merge({
	needs_sync = false,
	loaded = false,
}, _G._plugins or {})
_G.packer_plugins = _G.packer_plugins or {}

local M = {}
local packer = nil

local function init()
	local err = nil
	packer, err = pcall(function()
		return require('packer')
	end)

	if err then
		_G._plugins.needs_sync = require('bootstrap').packer()
		packer = require('packer')
	end
end

local function register_plugins()
	local use = packer.use
	packer.reset()

	-- Package manager
	use { 'wbthomason/packer.nvim', opt = false }

	-- Appearance
	require 'plugins.theme'.setup()
	
	-- TODO: Temporary
	-- Register listeners
	require('config').attach('theme', function(theme) 
		if _G.packer_plugins[theme] and not _G.packer_plugins[theme].loaded then
			-- TODO: We could just load the new theme and the old theme
			-- But we'd need the config to also pass in the old value
			packer.compile()
		end
	end)
end

function M.setup()
	init()

	-- Initialize packer
	packer.init({
		opt_default = true,
		display = {
			non_interactive = true,
		},
	})

	-- Register all of the plugins
	register_plugins()

	-- Sync when bootstrapped
	if _G._plugins.needs_sync or _G._plugins.debug then
		packer.sync()
	end

	_G._plugins.loaded = true
end

M._autoload = function()
	require('plugins').setup()
end

return M
