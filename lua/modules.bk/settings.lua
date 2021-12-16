local apply_options = function(opts)
	for k, v in pairs(opts) do
		if v == true then
			vim.cmd('set '..k)
		elseif v == false then
			vim.cmd('set no'..k)
		else
			vim.cmd(string.format('set %s=%s', k, v))
		end
	end
end

-- highlighting
vim.cmd [[ syntax enable ]]
vim.cmd [[ filetype plugin indent on ]]

local options = {
	hidden = true,
	foldlevel = 20,
	foldmethod = "syntax",
	wildmenu = true,
	confirm = true,
	showmatch = true,
	-- appearance
	termguicolors = true,
	linebreak = true,
	fillchars = [[eob:\ ,vert:\ ]],
	list = true,
	listchars = [[tab:\│\ ]],
	signcolumn = "number",
	-- tab
	expandtab = false,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	textwidth = 88,
	-- timeout
	timeoutlen = 200,
	updatetime = 250,
	-- line numbers
	number = true,
	relativenumber = true,
	shortmess = vim.o.shortmess .. "c",
	completeopt = "menu,menuone,noselect",
}

apply_options(options)

-- line number toggle
-- TODO: nvim doesn't yet have an api for autogroups. When it does, replace
-- this.
vim.cmd [[augroup number_toggle]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd BufEnter,FocusGained,InsertLeave * set relativenumber]]
vim.cmd [[autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber]]
vim.cmd [[augroup END]]
