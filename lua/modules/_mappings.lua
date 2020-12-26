-- This file is for general mappings. Plugin-specific mappings will be in the
-- respective plugin files. I made the decision to do this becaues it cleanly
-- separates plugin functionality and allows me to easily find a mapping for a
-- specific plugin -- and disabling that plugin will also disable the relevant
-- mappings.

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
remap('n', '<leader>sv', ':lua source_init()<CR>', { noremap = true })

-- jk -> esc
remap('i', 'jk', '<esc>', { noremap = true })
remap('v', 'jk', '<esc>', { noremap = true })
