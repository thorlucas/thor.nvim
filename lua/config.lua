local util = require('util')
local M = {}

_G._config = _G._config or {
	debug = false,
	_listeners = {},
	_scheduled = {},
}


local notify_at_level = function(ls, value, path)
	for _, l in ipairs(ls) do
		l(value, path)
	end
end

local notify = function(path)
	path = util.parse_path(path)
	local t = _G._config
	local l = t._listeners
	local p = {}

	for _, key in ipairs(path) do
		notify_at_level(l, t, p)

		l = l[key]
		t = t[key]
		table.insert(p, key)

		if l == nil then
			return
		elseif t == nil then
			break
		end
	end
	
	notify_at_level(l, t, p)
end

local notify_scheduled = function()
	for _, path in ipairs(t) do
		
	end
end

local schedule_notify = vim.schedule_wrap(M.notify)

M.merge = function(values, mode)
	util.merge(_G._config, values, mode)
	schedule_notify()
end

M.get = function(path)
	return util.path_get(_G._config, path)
end

M.set = function(path, value)
	path = util.parse_path(path)
	local t = _G._config
	for index, key in ipairs(path) do
		if index == #path then
			if t[key] == nil then
				t[key] = value
			elseif type(t[key]) == 'table' and type(value) == 'table' then
				merge(t[key], value)
			else
				t[key] = value
			end
		elseif t[key] == nil then
			t[key] = {}
		end
		t = t[key]
	end
	schedule_notify(path)
	return t
end

M.attach = function(path, callback)
	path = util.parse_path(path)
	local ls = _G._config._listeners

	for index, key in ipairs(path) do
		if ls[key] == nil then
			ls[key] = {}
		end

		if index == #path then
			table.insert(ls[key], callback)
		else
			ls = ls[key]
		end
	end
	
	local current = M.get(path)
	if current ~= nil then
		callback(current, path)
	end
end

setmetatable(M, {
	__index = _G._config,
	__call = function(this, values)
		this.merge(values)
		return this
	end,
})

return M
