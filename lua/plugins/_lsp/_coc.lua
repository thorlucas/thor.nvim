local M = {}
_G.plugins.coc = {}

vim.cmd [[packadd coc.nvim]]

local map = require('util.map')

function M.select_confirm(context)
	return vim.fn['coc#_select_confirm']()
end

function M.can_jump()
	return vim.fn['coc#jumpable']()
end

function M.can_jump_back()
	return vim.fn['coc#jumpable']()
end

--function M.expand_or_jump()
	--vim.cmd [[call coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]]
--end

-- TODO: Context
function M.jump(context)
	return map.map_context(context, [[coc#rpc#request('snippetNext', [])]])
end

function M.jump_back(context)
	return map.map_context(context, [[coc#rpc#request('snippetPrev', [])]])
end

map.keymap('n', 'gd', '<Plug>(coc-definition)',      { noremap = false })
map.keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map.keymap('n', 'gi', '<Plug>(coc-implementation)',  { noremap = false })
map.keymap('n', 'gr', '<Plug>(coc-references)',      { noremap = false })

map.keymap('n', '<leader>qf', '<Plug>(coc-fix-current)',    { noremap = false })
map.keymap('n', '<leader>ac', '<Plug>(coc-fix-codeaction)', { noremap = false })
map.keymap('n', '<leader>rn', '<Plug>(coc-rename)',         { noremap = false })
map.keymap('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })
map.keymap('v', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })

return M
