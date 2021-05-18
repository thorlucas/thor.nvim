local M = {}

local map = require('util.map')

vim.cmd [[packadd plenary.nvim]]
vim.cmd [[packadd popup.nvim]]
vim.cmd [[packadd telescope.nvim]]
vim.cmd [[packadd telescope-project.nvim]]

M.find_files = "<Cmd>lua require'telescope.builtin'.find_files()<CR>"
M.projects = "<Cmd>lua require'telescope'.extensions.project.project{ change_dir = true }<CR>"
M.reloader = "<Cmd>lua require'telescope.builtin'.reloader()<CR>"

require'telescope'.load_extension('project')

return M
