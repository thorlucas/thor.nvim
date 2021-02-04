local M = {}
_G.plugins.coc = {}

vim.cmd [[packadd coc.nvim]]

local map = require('util.map')

function M.select_confirm()
	return vim.fn['coc#_select_confirm']()
end

function M.can_jump()
	return vim.fn['coc#jumpable']()
end

map.keymap('n', 'gd', '<Plug>(coc-definition)',      { noremap = false })
map.keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map.keymap('n', 'gi', '<Plug>(coc-implementation)',  { noremap = false })
map.keymap('n', 'gr', '<Plug>(coc-references)',      { noremap = false })

map.keymap('n', '<leader>qf', '<Plug>(coc-fix-current)',    { noremap = false })
map.keymap('n', '<leader>ac', '<Plug>(coc-fix-codeaction)', { noremap = false })
map.keymap('n', '<leader>rn', '<Plug>(coc-rename)',         { noremap = false })

return M