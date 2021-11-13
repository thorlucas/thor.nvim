-- load plugin manager
require("plugins.packer")

-- load modules
require("modules.settings")
require("modules.lsp")
require("modules.editor")
require("modules.aesthetic")
require("modules.mappings")

-- DEBUGGING MY OTHER CONFIG
dev_rmt = [[!nvr --servername $NVIM_LISTEN_ADDRESS_DEV -c "lua debug_reload()"]]
vim.cmd[[command! DevReload lua vim.cmd(dev_rmt)]]

local dev_path = vim.env.DEV
print(dev_path)
vim.cmd([[
augroup dev_reload
  autocmd!
  autocmd BufWritePost */nvim/** silent DevReload
augroup end]])
