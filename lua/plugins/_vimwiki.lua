vim.g.vimwiki_list = {
	{
		path = '~/Dropbox/Wiki',
		path_html = '~/Dropbox/Wiki_HTML/',
		template_path = '~/Dropbox/Wiki/Templates/',
		template_default = 'default',
		syntax = 'markdown',
		ext = '.md',
		custom_wiki2html = '~/.local/share/nvim/scripts/wiki2html.sh',
	}
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

-- A bug with Vimwiki forces me to load the plugin after the global variable is
-- set. https://github.com/vimwiki/vimwiki/issues/1072
vim.cmd [[packadd vimwiki]]
