local M = {}
local _listeners = {}

_G._config = _G._config or {
	debug = false,
	_listeners = {},
}

local function merge(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == 'table' then
			if type(t1[k] or false) == 'table' then
				merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end

	return t1
end

local parse_path_string = function(path)
	if path == nil then
		return {}
	elseif type(path) == 'string' then
		return vim.fn.split(path, [[\.]])
	elseif type(path) == 'table' then
		return path
	else
		vim.notify("Error parsing path: "..vim.inspect(path))
	end
end

local notify_at_level = function(ls, value, path)
	for _, l in ipairs(ls) do
		l(value, path)
	end
end

M.notify = function(path)
	path = parse_path_string(path)
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

local schedule_notify = vim.schedule_wrap(M.notify)

M.merge = function(values)
	merge(_G._config, values)
	schedule_notify()
end

M.get = function(path)
	path = parse_path_string(path)
	local t = _G._config
	for _, key in ipairs(path) do
		if t == nil then
			return nil
		end
		t = t[key]
	end
	return t
end

M.set = function(path, value)
	path = parse_path_string(path)
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
	path = parse_path_string(path)
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
