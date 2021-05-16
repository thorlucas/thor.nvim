local M = {}

vim.cmd [[ packadd vimtex ]]
vim.cmd [[ packadd vim-easy-align ]]

vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_compiler_latexmk = {
	build_dir = "build",
}
vim.g.vimtex_quickfix_ignore_filters = { "hbox" }

require'util.map'.keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false })
require'util.map'.keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })

return M
