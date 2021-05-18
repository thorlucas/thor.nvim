vim.o.completeopt = "menu,menuone,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"


-- TODO: Move all of this to a separate completion file
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	else
		return t "<S-Tab>"
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })


--vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { expr = true, silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true, silent = true, noremap = true })

require'compe'.setup {
	enabled = true;
	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		ultisnips = true;
	};
}
