_G._config = _G._config or {
	_autoload = true,
	_listeners = {},
	modules = setmetatable({}, {
		__index = function(self, m)
			local stat, res = pcall(function()
				return require(m)._defaults
			end)
			if stat then
				print("Loading defaults for mod: "..m)
				if type(res) == 'function' then
					res = res()
				end
				self[m] = res
			else
				self[m] = {}
			end
			return self[m]
		end,
	}),
}
local loaded = false

local M = {}
local man = require('config.man')

local configs = function()
	-- TODO: Read from file automatically
	local t = {}

	for _, m in ipairs({
		'debug',
		'theme',
		'vim',
		'managers',
		'mappings',
	}) do
		t[m] = require('config._'..m)
	end

	return t
end

M._autoload = function()
	if not loaded then
		man.merge(configs(), false)
		loaded = true
	end
end

if _G._config._autoload then
	M._autoload()
end

setmetatable(M, {
	__index = man,
	__call = getmetatable(man).__call,
})

return M
