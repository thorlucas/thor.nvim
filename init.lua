_G.plugins = {}
_G.thor = {}

-- bootstrap
require("modules._bootstrap")

-- load plugin manager
require("plugins._packer")

-- settings
require("modules._settings")
require("modules._mappings")
require("modules._appearance")

-- plugins config
require("plugins._luatree")
require("plugins._luadev")
require("plugins._lsp")
require("plugins._vimwiki")
require("plugins._goyo")
require("plugins._telescope")

-- custom
--require("custom._school");
require("custom._wiki")
