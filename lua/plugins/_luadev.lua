vim.cmd [[packadd nvim-luadev]]

vim.cmd [[augroup plugin_nvim-luadev]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd FileType lua nmap <leader>ll <Plug>(Luadev-RunLine)]]
vim.cmd [[autocmd FileType lua vmap <leader>ll <Plug>(Luadev-Run)]]
vim.cmd [[augroup END]]
