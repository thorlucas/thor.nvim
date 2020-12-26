local remap = vim.api.nvim_set_keymap

-- alt + arrow keys -> window switching
remap('n', '<A-Up>',    '<C-w>k', { noremap = true, silent = true })
remap('n', '<A-Down>',  '<C-w>j', { noremap = true, silent = true })
remap('n', '<A-Right>', '<C-w>l', { noremap = true, silent = true })
remap('n', '<A-Left>',  '<C-w>h', { noremap = true, silent = true })

-- ev -> edit vim, sv -> source vim
-- TODO: Now that init is split across multiple files, it would be useful to
-- also open up LuaTree in the init directory
remap('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', { noremap = true })
remap('n', '<leader>sv', ':luafile $MYVIMRC<CR>', { noremap = true })

-- jk -> esc
remap('i', 'jk', '<esc>', { noremap = true })
remap('v', 'jk', '<esc>', { noremap = true })
