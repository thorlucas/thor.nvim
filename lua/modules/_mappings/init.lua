-- This file is for general mappings. Plugin-specific mappings will be in the
-- respective plugin files. I made the decision to do this becaues it cleanly
-- separates plugin functionality and allows me to easily find a mapping for a
-- specific plugin -- and disabling that plugin will also disable the relevant
-- mappings.

local map = require('util.map')

-- alt + arrow keys -> window switching
map.keymap('n', '<A-Up>',    '<C-w>k')
map.keymap('n', '<A-Down>',  '<C-w>j')
map.keymap('n', '<A-Right>', '<C-w>l')
map.keymap('n', '<A-Left>',  '<C-w>h')


-- ev -> edit vim, sv -> source vim
-- TODO: Now that init is split across multiple files, it would be useful to
-- also open up LuaTree in the init directory
--map.keymap('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
--map.keymap('n', '<leader>sv', ':lua source_init()<CR>')

-- jk -> esc
map.keymap('i', 'jk', '<esc>')
map.keymap('v', 'jk', '<esc>')
map.keymap('t', 'jk', '<C-\\><C-n>')

-- expansion
local comp = require('modules._mappings._completion')

map.keymap('i', '<Tab>', comp.expand_or_jump(map.context.I, map.esc("<Tab>")))
map.keymap('s', '<Tab>', comp.expand_or_jump(map.context.S, map.esc("<Tab>")))

map.keymap('i', '<S-Tab>', comp.jump_back(map.context.I, map.esc("<C-h>")))
map.keymap('s', '<S-Tab>', comp.jump_back(map.context.S, map.esc("<C-h>")))

map.keymap('i', '<CR>', comp.complete(map.context.I, map.esc("<CR>")))

-- telescope
local tele = require('plugins._telescope')
local wk = require('which-key')

wk.register({
	["<leader>"] = {
		f = {
			name = "+file",
			f = { tele.find_files, "Find file" },
			p = { tele.projects, "Find project" },
			t = { "<Cmd>echo 'hello'<CR>", "Test" },
		},
	},
})

--map.keymap('n', '<leader>ff', tele.find_files)
--map.keymap('n', '<leader>fp', tele.projects)
--map.keymap('n', '<leader>rl', tele.reloader)

-- vimwiki
-- TODO: Delegate
-- TODO: Filetype

map.keymap('n', '<leader>t<Right>', '<Plug>VimwikiTableMoveColumnRight', { noremap = false })
map.keymap('n', '<leader>t<Left>', '<Plug>VimwikiTableMoveColumnLeft', { noremap = false })
