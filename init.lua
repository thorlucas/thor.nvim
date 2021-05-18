_G.plugins = {}
_G.thor = {}


-- load plugin manager
require("plugins.packer")

-- plugins config

-- colorscheme
require("plugins.nord")

-- lsp
require("plugins.lspconfig")
require("plugins.compe")
--require("plugins.treesitter")

--editor
require("plugins.nvimtree")

--require("plugins.whichkey")
--require("plugins.telescope")
--require("plugins.vimtex")
--require("plugins.vimwiki")
