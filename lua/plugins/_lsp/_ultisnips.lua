-- TODO: We really want to actually move this into the function we put in _coc,
-- otherwise this takes precedence over the pum stuff
vim.g.UltiSnipsExpandTrigger = "<leader><Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<leader><Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<leader><S-Tab>"

vim.cmd [[packadd ultisnips]]
