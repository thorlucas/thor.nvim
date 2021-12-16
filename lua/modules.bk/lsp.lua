-- plugins
require("plugins.lspconfig")
require("plugins.compe")
require("plugins.lspkind")
require("plugins.lspsaga")
require("plugins.treesitter")
require("plugins.vsnip");
require("plugins.copilot");

local t = require'util.vim'.termcode
local check_back_space = require'util.vim'.check_back_space

_G.tab_complete = function()
	if vim.g.UltiSnipsEnabled and (vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1) then
		return t "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"
	elseif vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return t "<Plug>(vsnip-expand-or-jump)"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	else
		return t "<S-Tab>"
	end
end


