_G._config = _G._config or {
	_listeners = {},
}

local M = {}
local man = require('config.man')

local configs = function()
	-- TODO: Read from file automatically
	local t = {}

	for _, m in ipairs({
		'debug',
		'theme',
		'vim',
	}) do
		t[m] = require('config._'..m)
	end

	return t
end

-- Every defaults has to promise to not do any initialization. They can be functions or
-- tables, but if they're functions, they must promise to not initialize anything --
-- only return default configs.
M._defaults = function()
	local t = {
		debug = true,
		modules = {},
	}

	for _, m in ipairs({
		'plugins',
		'bootstrap',
	}) do
		local d = require(m)._defaults or {}

		if type(d) == 'function' then
			t.modules[m] = d()
		elseif type(d) == 'table' then
			t.modules[m] = d
		else
			vim.notify(vim.fn.printf("Fatal: Unrecognized config defaults format for module: %s", m), 4)
		end
	end

	return t
end

M._autoload = function()
	local config = require('config')
	config(configs())
end

-- Sort of a unique situation here because config's default configs have to be loaded
-- when you load config... lol
require('util').merge(_G._config, M._defaults())

setmetatable(M, {
	__index = man,
	__call = getmetatable(man).__call,
})

return M
