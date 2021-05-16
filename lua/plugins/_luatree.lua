vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'dist', '.DS_Store' }
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0

vim.cmd [[packadd nvim-tree.lua]]

require('util.map').keymap('n', '<C-n>', ':NvimTreeToggle<CR>')
