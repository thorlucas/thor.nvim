vim.g.vimwiki_list = {
	{
		path = '~/Dropbox/Wiki',
		syntax = 'markdown',
		ext = '.md',
	},
	{
		path = '~/Dropbox/Projects/School/Current',
		syntax = 'markdown',
		ext = '.md',
	},
}

vim.g.vimwiki_key_mappings = {
	all_maps = 1,
	global = 1,
	headers = 1,
	text_objs = 1,
	table_format = 0,
	table_mappings = 0,
	lists = 1,
	links = 1,
	html = 1,
	mouse = 0,
}

vim.g.vimwiki_markdown_link_ext = 1

-- A bug with Vimwiki forces me to load the plugin after the global variable is
-- set. https://github.com/vimwiki/vimwiki/issues/1072
vim.cmd [[packadd vimwiki]]
