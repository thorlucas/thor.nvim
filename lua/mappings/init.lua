_G._mappings = _G._mappings or {
	manager = nil,
}
local M = {}

M.set_mappings = function(mappings)
	if _G._mappings.manager then
		for _, m in ipairs(mappings) do
			_G._mappings.manager.register(unpack(m))
		end
	end
end

M.set_mappings_manager = function(manager)
	_G._mappings.manager = manager
	M.set_mappings(require('config')['mappings'])
end

M._autoload = function()
	require('config').attach('mappings', M.set_mappings)
end

return M
