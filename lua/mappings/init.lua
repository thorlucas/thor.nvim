_G._mappings = _G._mappings or {
	manager = nil,
}

local util = require('util')
local M = {}

---@alias KeyMap.mode nil | '"!"' | '"n"' | '"v"' | '"o"' | '"i"' | '"c"' | '"s"' | '"x"' | '"l"' | '"t"'

---@class KeyMap.opts
---@field buffer? number | boolean
---@field silent? boolean
---@field nowait? boolean
---@field script? boolean
---@field expr? boolean
---@field unique? boolean
---@field noremap? boolean
---@field remap? boolean
---@field desc? string
---@field callback? function
---@field replace_keycodes? boolean

---@alias KeyMap.lhs string

---@alias KeyMap.rhs string | fun(): any

---@class KeyMap
---@field mode KeyMap.mode
---@field lhs KeyMap.lhs
---@field rhs KeyMap.rhs
---@field opts KeyMap.opts
local KeyMap = setmetatable({}, {
	__index = function (self, key)
		return self.opts[key]
	end
})

---@param mode KeyMap.mode
function KeyMap:new(mode, lhs, rhs, opts)

end


map = function (mapping, opts)
	if type(mapping[1]) == 'string' or type(mapping[1]) == 'function' then
		opts = util.merge({
			silent = true,
			noremap = true,
			nowait = false,
			desc = mapping[2],
		}, opts or {})
	end
end


M._autoload = function ()
	require('config').attach('mappings', M.set_mappings)
end

return M
