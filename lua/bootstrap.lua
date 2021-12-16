local fn = vim.fn

local M = {}

local default_paths = {
	packer = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim',
}

---Ensures that `packer.nvim` is installed.
---@param path string the path to install packer to. Defaults to somewhere in stdpath('data').
---@return boolean whether packer was just installed.
function M.packer(path)
	path = path or default_paths.packer

	if fn.empty(fn.glob(path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path})
		return true
	else
		return false
	end
end

return M
