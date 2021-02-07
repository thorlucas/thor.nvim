vim.cmd [[packadd nvim-treesitter]]

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp" },
	highlight = {
		enable = { "c", "cpp" },
		disable = { "lua", "rust" },
	}
}
