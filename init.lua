_G.plugins = {}
_G.thor = {}

-- bootstrap
require("modules._bootstrap")

-- load plugin manager
require("plugins._packer")

-- settings
require("modules._settings")
--require("modules._mappings")
require("modules._appearance")

-- plugins config
require("plugins._luatree")
require("plugins._whichkey")
require("plugins._luadev")
require("plugins._lsp")
require("plugins._vimwiki")
require("plugins._goyo")
require("plugins._telescope")
require("plugins._vimtex")

require("modules._mappings")

-- custom
--require("custom._school");
require("custom._wiki")

-- TODO: Temporary
--vim.cmd [[augroup blade_ft]]
--vim.cmd [[au!]]
--vim.cmd [[autocmd BufNewFile,BufRead *.blade.php set filetype=blade]]
--vim.cmd [[augroup END]]

vim.cmd [[set nocp]]
vim.cmd [[filetype plugin on]]
