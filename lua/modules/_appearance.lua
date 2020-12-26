vim.cmd [[packadd ayu-vim]]
vim.cmd [[packadd nvim-web-devicons]]

local apply_highlights = function(hls)
	for _, hl in ipairs(hls) do
		local group, opts = unpack(hl)
		local bg = opts.bg == nil and '' or 'guibg='..opts.bg
		local fg = opts.fg == nil and '' or 'guifg='..opts.fg
		local gui = opts.gui == nil and '' or 'gui='..opts.gui
		local format = string.format('hi %s %s %s %s', group, fg, bg, gui)
		vim.cmd(format)
	end
end


vim.g.ayucolor = 'mirage'
vim.cmd [[colorscheme ayu]]

local highlights = {
	{ 'EndOfBuffer', { fg = 'bg' }},
	{ 'SignColumn', { bg = 'bg' }},
	{ 'CursorLineNr', { bg = 'bg' }},
}

apply_highlights(highlights)
