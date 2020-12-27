vim.cmd [[packadd coc.nvim]]

local map = require('util.map')

_G.plugins.coc = {}

local function check_back_space()
	local col = vim.fn.col('.') - 1
	return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local function pumvisible()
	return vim.fn.pumvisible() == 1
end

function _G.plugins.coc.tab_completion()
	if pumvisible() then
		return map.esc('<C-n>')
	elseif check_back_space() then
		return map.esc('<Tab>')
	else
		return vim.fn['coc#refresh']()
	end

	-- TODO: I can't get this to work right
	-- https://github.com/SirVer/ultisnips/issues/1305
	-- return '<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>'
end

function _G.plugins.coc.shift_tab_completion()
	if pumvisible() then
		return map.esc('<C-p>')
	else
		return map.esc('<C-h>')
	end
end

function _G.plugins.coc.return_completion()
	if pumvisible() then
		return vim.fn['coc#_select_confirm']()
	else
		return map.esc('<CR>')
	end
end

-- TODO: There is more to this command: https://github.com/neoclide/coc.nvim
map.keymap('i', '<Tab>',   'v:lua.plugins.coc.tab_completion()',       { expr = true })
map.keymap('i', '<S-Tab>', 'v:lua.plugins.coc.shift_tab_completion()', { expr = true })
map.keymap('i', '<CR>',    'v:lua.plugins.coc.return_completion()',    { expr = true })

map.keymap('n', 'gd', '<Plug>(coc-definition)',      { noremap = false })
map.keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map.keymap('n', 'gi', '<Plug>(coc-implementation)',  { noremap = false })
map.keymap('n', 'gr', '<Plug>(coc-references)',      { noremap = false })

map.keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = false })
