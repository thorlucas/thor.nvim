-- TODO: We really want to actually move this into the function we put in _coc,
-- otherwise this takes precedence over the pum stuff
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

vim.cmd [[packadd ultisnips]]
