require'compe'.setup {
	enabled = true;
	source = {
		path = true;
		buffer = false;
		calc = false;
		nvim_lsp = true;
		nvim_lua = false;
		treesitter = false;
		vsnip = true;
		ultisnips = true;
	};
}
