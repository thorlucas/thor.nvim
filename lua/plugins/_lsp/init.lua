-- TODO: We're going with coc here because the built in LSP is lacking in many
-- aspects. I'd like to switch to the built in LSP once it's more fully flushed
-- out, but I wasn't able to get it looking as pretty or working as nicely as I
-- was able to get coc working.

require('plugins._lsp._coc')
require('plugins._lsp._nerdcommenter')
require('plugins._lsp._ultisnips')
require('plugins._lsp._treesitter')
