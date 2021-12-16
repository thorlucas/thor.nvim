local util = require('util')
local M = {}
local listeners = {}

_G._config = _G._config or {
	debug = false,
}

local notify = function(path)
	for p, t, ls in util.walk_path(path, _G._config, listeners) do
		if ls == nil then
			return
		end

		for _, l in ipairs(ls) do
			l(t, p)
		end
	end
end

M.merge = function(values, mode)
	local t = util.merge(_G._config, values, mode)
	notify()
	return t
end

M.get = function(path)
	return util.path_get(_G._config, path)
end

M.set = function(path, value, mode)
	path = util.parse_path(path)
	local t = util.path_set(_G._config, path, value, mode)
	notify(path)
	return t
end

M.attach = function(path, callback)
	path = util.parse_path(path)
	util.path_set(listeners, path, { callback }, 'insert')

	local current = util.path_get(_G._config, path)
	if current ~= nil then
		callback(current, path)
	end
end

setmetatable(M, {
	__index = _G._config,
	__call = function(this, values)
		return this.merge(values)
	end,
})

return M
