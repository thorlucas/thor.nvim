vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd completion-nvim]]
vim.cmd [[packadd lsp_extensions.nvim]]

-- https://sharksforarms.dev/posts/neovim-rust/

local nvim_lsp = require('lspconfig')
local completion = require('completion')
local extensions = require('lsp_extensions')

vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

vim.cmd [[set completeopt=menuone,noinsert,noselect]]
vim.cmd [[set shortmess+=c]]

vim.cmd [[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
vim.cmd [[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

-- vim.cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
-- \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }]]

extensions.inlay_hints({ prefix = '', highlight = 'Comment' })

nvim_lsp.rust_analyzer.setup({ on_attach = completion.on_attach })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
