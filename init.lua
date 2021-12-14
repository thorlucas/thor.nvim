G = {}

-- load plugin manager
require("plugins.packer")

-- load modules
require("modules.settings")
require("modules.lsp")
require("modules.editor")
require("modules.aesthetic")
require("modules.mappings")

function G.refresh_test()
	local refresh_cmd = [[echo 'hello']]
	vim.cmd('! nvr --servername "${NVIM_LISTEN_ADDRESS}-test" -c "'..refresh_cmd..'"')
end

-- temp: reload nvimtest when in dev mode
--vim.cmd[[
--	autocmd BufWritePost *.lua silent lua G.refresh_test()
--]]
