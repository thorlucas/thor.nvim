local M = {}
local config = {}

_G[config] = _G[config] or {
	debug = false,
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
	return vim.fn.split(path, [[\.]])
end

M.merge = function(values)
	merge(_G[config], values)
	print("shoud reload")
end

M.get = function(path_string)
	local path = path_string and parse_path_string(path_string) or {}
	local table = _G[config]
	for _, key in ipairs(path) do
		if table == nil then
			return nil
		end
		table = table[key]
	end
	return table
end

M.set = function(path_string, value)
	local path = parse_path_string(path_string)
	local table = _G[config]
	for index, key in ipairs(path) do
		if index == #path then
			if table[key] == nil then
				table[key] = value
			elseif type(table[key]) == 'table' and type(value) == 'table' then
				merge(table[key], value)
			else
				table[key] = value
			end
		elseif table[key] == nil then
			table[key] = {}
		end
		table = table[key]
	end
	return table
end

setmetatable(M, {
	__index = _G[config],
	__call = function(this, values)
		this.merge(values)
		return this
	end,
})

return M
