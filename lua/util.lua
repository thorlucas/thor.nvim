---The `util` module provides utility functions for interacting with tables and for
-- setting vim options.

local M = {}

M.empty = function(t) 
	return not next(t)
end

M.empty_to_nil = function(t)
	if M.empty(t) then
		return nil
	else
		return t
	end
end

M.merge = function(t1, t2, insert)
	insert = insert or false

	local diff = {}
	for k, v in pairs(t2) do
		if type(k) == 'number' and insert then
			table.insert(diff, v)
			table.insert(t1, v)
		elseif type(v) == 'table' then
			if not M.empty(v) then
				if type(t1[k]) == 'table' then
					diff[k] = M.merge(t1[k], v, insert)
				else
					diff[k] = v
					t1[k] = v
				end
			end
		elseif t1[k] ~= v then
			diff[k] = v
			t1[k] = v
		end
	end
	return M.empty_to_nil(diff)
end

-- For convenience we want a function that is equivalent to 
-- M.merge(t1, { a = { b = { c = "d" } } }, insert) but that can be written as
-- M.set(t1, {'a', 'b', 'c'}, 'd', insert)
M.set = function(t1, p, v, insert)
	p = M.parse_path(p)
	local t2 = v
	for i = #p, 1, -1 do
		t2 = { [p[i]] = t2 }
	end
	return M.merge(t1, t2, insert)
end

---Gets a value from a table using a path.
---@param t table the table to index
---@param p string|table|nil the path
---@returns any the value of the table at the path or nil
M.get = function(t, p)
	p = M.parse_path(p)
	for _, comp in ipairs(p) do
		if t == nil then
			return nil
		end
		t = t[comp]
	end
	return t
end

---Parses a path, returning a list containing each component.
---@param path string|table|nil the path to parse
---@return table an array with each path component
M.parse_path = function(path)
	if type(path) == 'table' then
		return path
	elseif path == nil then
		return {}
	elseif type(path) == 'string' then
		return vim.fn.split(path, [[\.]])
	else
		vim.notify("Error parsing path: "..vim.inspect(path))
		return nil
	end
end

M._walk_path_inner = function(path, ...)
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
		return M._walk_path_inner(path, unpack(ts))
	end)
end

---Walks along all nodes of a table, zipping with the keys of another table. Only those values where both tables have non-nil entries are returned.
M._zip_inner = function(t1, t2)
	if t2 == nil or t1 == nil then
		return
	end

	coroutine.yield(t1, t2)

	if type(t1) == 'table' and type(t2) == 'table' then
		for k, v in pairs(t1) do
			M._zip_inner(v, t2[k])
		end
	end
end

M.zip = function(t1, t2)
	return coroutine.wrap(function()
		return M._zip_inner(t1, t2)
	end)
end

---Sets vim options.
-- Uses `:set <opt>` if the option is set to true and `:set no<opt>` if set to false.
-- Otherwise, uses `:set <opt> = <value>`.
M.set_opts = function(opts)
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

M.run_cmds = function(cmds)
	for k, v in pairs(cmds) do
		if type(k) == 'string' then
			if type(v) == 'table' then
				vim.cmd(k.." "..vim.fn.join(v, " "))
			else
				vim.cmd(k.." "..v)
			end
		else
			vim.cmd(v)
		end
	end
end

return M
