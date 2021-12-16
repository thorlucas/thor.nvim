local M = {}
local fn = vim.fn

---Tries to autoloads the indicated modules.
-- Does this by trying to call `<module>._autoload()`.
M.autoload = function(...)
	-- TODO: Allow async here
	for _, m in ipairs(...) do
		local status, err = pcall(function()
			require(m)._autoload()
		end)
		if status == false then
			vim.notify(vim.fn.printf("Fatal: Error while autoloading module %s: %s", m, vim.inspect(err)), 4)
		end
	end
end

---Ensures that `packer.nvim` is installed.
---@return boolean whether packer was just installed.
M.packer = function()
	local path = require('config')['modules.bootstrap.paths.packer']

	if fn.empty(fn.glob(path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path})
		return true
	else
		return false
	end
end

M._defaults = {
	paths = {
		packer = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim',
	},
}

return M
