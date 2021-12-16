_G._keymap = _G._keymap or {
	manager = nil,
}
local M = {}

M.set_mappings = function(mappings)
	if _G._keymap.manager then
		print("registering mappings")
		for _, m in ipairs(mappings) do
			_G._keymap.manager.register(unpack(m))
		end
	end
end

M.set_keymap_manager = function(manager)
	_G._keymap.manager = manager
	M.set_mappings(require('config')['mappings'])
end

M._autoload = function()
	require('config').attach('mappings', M.set_mappings)
end

return M
