local M = {}

---Merges two tables with an option to replace by numeric keys or to insert.
---@param t1 table the table that will be merged into
---@param t2 table the table to merge
---@param mode 'replace'|'insert' whether to replace numeric keys or to insert
M.merge = function(t1, t2, mode)
	mode = mode or 'replace'
	if t2 == nil then
		return
	end

	for k, v in pairs(t2) do
		if mode == 'insert' and type(k) == 'number' then
			if type(t1) == 'table' then
				table.insert(t1, v)
			else
				t1[k] = v
			end
		elseif type(v) == 'table' then
			if type(t1[k] or false) == 'table' then
				M.merge(t1[k] or {}, t2[k] or {}, mode)
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end

	return t1
end

---Parses a path, returning a list containing each component.
---@param path string|table|nil the path to parse
---@return table an array with each path component
M.parse_path = function(path)
	if path == nil then
		return {}
	elseif type(path) == 'string' then
		return vim.fn.split(path, [[\.]])
	elseif type(path) == 'table' then
		return path
	else
		vim.notify("Error parsing path: "..vim.inspect(path))
		return nil
	end
end

---Creates a nested key-value table mapping a path to a value.
---@param path string|table|nil
---@return table the nested key-value table
M.path_value_table = function(path, value)
	path = M.parse_path(path)
	local pv = {}
	local t = pv
	for i, comp in ipairs(path) do
		if i == #path then
			t[comp] = value
		else
			t[comp] = {}
		end
		t = t[comp]
	end
	return pv
end

---Gets a value from a table using a path.
---@param t table the table to index
---@param path string|table|nil the path
---@returns any the value of the table at the path or nil
M.path_get = function(t, path)
	path = M.parse_path(path)
	for _, comp in ipairs(path) do
		if t == nil then
			return nil
		end
		t = t[comp]
	end
	return t
end

---Similar to merge(), but only with one value.
---In order for this function to insert, the value must be a table. In that case,
---`merge()` will be called on the target path and the value.
---
---If the path already exists on the target but isn't a table, then it will replace
---instead of insert.
M.path_set = function(t, path, value, mode)
	path = M.parse_path(path)
	mode = mode or 'replace'
	
	for i, comp in ipairs(path) do
		if i == #path then
			if mode == 'insert' and type(value) == 'table' then
				if type(t[comp]) == 'table' then
					M.merge(t[comp], value, mode)
				else
					t[comp] = value
				end
			else
				t[comp] = value
			end
		else
			if t[comp] == nil then
				t[comp] = {}
			end
		end
		t = t[comp]
	end

	return t
end

local walk_path_inner = function(path, ...)
	local ts = {...}
	local p = {}
	coroutine.yield(p, unpack(ts))
	for _, comp in ipairs(path) do
		for i, t in ipairs(ts) do
			if type(t) == 'table' then
				ts[i] = t[comp]
			else
				ts[i] = nil
			end
		end
		table.insert(p, comp)
		coroutine.yield(p, unpack(ts))
	end
end


---Returns an iterator walking a path for any number of tables.
-- For each iteration, this function will yield the current path, as well as the values
-- for each of the tables when indexed by that path. If the table has no value along
-- that path, it will instead yield `nil`.
---@param path string|table|nil
---@param ... table
---@return fun() an iterator
M.walk_path = function(path, ...)
	path = M.parse_path(path)
	local ts = {...}
	return coroutine.wrap(function()
		return walk_path_inner(path, unpack(ts))
	end)
end


---Sets vim options.
-- Uses `:set <opt>` if the option is set to true and `:set no<opt>` if set to false.
-- Otherwise, uses `:set <opt> = <value>`.
M.set_opt = function(opts)
	for k, v in pairs(opts) do
		if v == true then
			vim.cmd('set '..k)
		elseif v == false then
			vim.cmd('set no'..k)
		else
			vim.cmd(string.format('set %s=%s', k, v))
		end
	end
end


return M
