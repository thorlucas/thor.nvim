vim.cmd [[packadd coc.nvim]]
vim.cmd [[packadd nerdcommenter]]

-- TODO: We're going with coc here because the built in LSP is lacking in many
-- aspects. I'd like to switch to the built in LSP once it's more fully flushed
-- out, but I wasn't able to get it looking as pretty or working as nicely as I
-- was able to get coc working.

local remap = vim.api.nvim_set_keymap

-- TODO: There is more to this command: https://github.com/neoclide/coc.nvim
remap('i', '<Tab>',   [[pumvisible() ? "<C-n>" : "<Tab>"]],   { noremap = true, silent = true, expr = true })
remap('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<S-Tab>"]], { noremap = true, silent = true, expr = true })
remap('i', '<CR>', [[pumvisible() ? coc#_select_confirm() : "<CR>"]], { noremap = true, silent = true, expr = true })
