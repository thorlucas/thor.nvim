require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"rust",
		"javascript",
		"html",
		"css",
		"lua",
		"json",
		"python",
		"bash"
	},
	highlight = {
		enable = true,
		use_languagetree = true
	}
}
