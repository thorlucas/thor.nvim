-- This file is for general mappings. Plugin-specific mappings will be in the
-- respective plugin files. I made the decision to do this becaues it cleanly
-- separates plugin functionality and allows me to easily find a mapping for a
-- specific plugin -- and disabling that plugin will also disable the relevant
-- mappings.

local map = require('util.map')
local comp = require('modules._mappings._completion')

-- alt + arrow keys -> window switching
map.keymap('n', '<A-Up>',    '<C-w>k')
map.keymap('n', '<A-Down>',  '<C-w>j')
map.keymap('n', '<A-Right>', '<C-w>l')
map.keymap('n', '<A-Left>',  '<C-w>h')


-- ev -> edit vim, sv -> source vim
-- TODO: Now that init is split across multiple files, it would be useful to
-- also open up LuaTree in the init directory
map.keymap('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
map.keymap('n', '<leader>sv', ':lua source_init()<CR>')

-- jk -> esc
map.keymap('i', 'jk', '<esc>')
map.keymap('v', 'jk', '<esc>')

-- expansion
map.keymap('i', '<Tab>', comp.expand_or_jump(map.context.I, map.esc("<Tab>")))
map.keymap('s', '<Tab>', comp.expand_or_jump(map.context.S, map.esc("<Tab>")))

map.keymap('i', '<S-Tab>', comp.jump_back(map.context.I, map.esc("<C-h>")))
map.keymap('s', '<S-Tab>', comp.jump_back(map.context.S, map.esc("<C-h>")))

map.keymap('i', '<CR>', comp.complete(map.context.I, map.esc("<CR>")))
