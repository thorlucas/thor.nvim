vim.cmd [[packadd nvim-luadev]]

local autocmd = require('util.autocmd')

-- TODO: Change this to be a callback to map.keymap
autocmd.autogroup('plugin_nvim-luadev', {
	{'FileType', 'lua', [[nmap <leader>ll <Plug>(Luadev-RunLine)]]},
	{'FileType', 'lua', [[vmap <leader>ll <Plug>(Luadev-Run)]]},
})
