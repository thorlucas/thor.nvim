-- TODO: This is broken as hell
source_init = function()
	for k, v in pairs(package.loaded) do
		require'plenary.reload'.reload_module(k)
	end
end

-- Recompile Packer automatically
vim.cmd [[autocmd BufWritePost _packer.lua PackerCompile]]
