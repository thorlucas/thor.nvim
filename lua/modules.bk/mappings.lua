require("plugins.whichkey")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { silent = true, noremap = true });
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { silent = true, noremap = true });

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

--vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { expr = true, silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true, silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "<A-Left>",  "<C-w>h", { silent = true, noremap = true });
vim.api.nvim_set_keymap("n", "<A-Right>", "<C-w>l", { silent = true, noremap = true });
vim.api.nvim_set_keymap("n", "<A-Up>",    "<C-w>k", { silent = true, noremap = true });
vim.api.nvim_set_keymap("n", "<A-Down>",  "<C-w>j", { silent = true, noremap = true });

vim.api.nvim_set_keymap("n", "<C-n>",  "<Cmd>NvimTreeToggle<CR>", { silent = true, noremap = true });
