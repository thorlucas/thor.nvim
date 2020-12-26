vim.cmd [[packadd nvim-tree.lua]]

vim.g.lua_tree_auto_open = 1
vim.g.lua_tree_ignore = { '.git', 'node_modules', '.cache', 'dist', '.DS_Store' }
vim.g.lua_tree_tab_open = 1
vim.g.lua_tree_git_hl = 1
vim.g.lua_tree_show_icons = { git = 0, folders = 1, files = 1 }

require('util.map').keymap('n', '<C-n>', ':LuaTreeToggle<CR>')
