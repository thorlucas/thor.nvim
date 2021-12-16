local M = {}
local util = require('util')

---Walks along every node in `t`, and calls the corresponding listener if that node is
-- not nil.
---@param t table
local notify = function(t)
	print("NOTIFYING DIFS: "..vim.inspect(t))
	for d, ls in util.zip(t, _G._config._listeners) do
		for _, l in ipairs(ls) do
			l(d)
		end
	end
end

M.attach = function(path, callback)
	path = util.parse_path(path)
	util.set(_G._config._listeners, path, { callback }, true)

	local current = util.get(_G._config, path)
	if current ~= nil then
		callback(current, path)
	end
end

M.merge = function(values, insert)
	local diffs = util.merge(_G._config, values, insert)
	notify(diffs)
end

M.get = function(path)
	return util.get(_G._config, path)
end

M.set = function(path, value, insert)
	local diffs = util.set(_G._config, path, value, insert)
	notify(diffs)
end

setmetatable(M, {
	__index = function(this, path)
		return this.get(path)
	end,
	__call = function(this, values, mode)
		return this.merge(values, mode)
	end
})

return M
