local M = {}
local packer = require'packer'
local use = packer.use

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.setup = function()
	local cmp = require'cmp'
	local luasnip = require'luasnip'

	cmp.setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		mapping = {
			["<leader><Tab>"] = cmp.mapping(function(fallback)
				-- TODO: 
				-- if cmp.get_selected_entry() then
				-- end

				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
					cmp.abort()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if not cmp.get_selected_entry() and luasnip.expandable() then
						luasnip.expand()
					else
						cmp.select_next_item()
					end
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			['<CR>'] = cmp.mapping.confirm(),
		},
		sources = cmp.config.sources({
			{
				name = 'luasnip'
			},
			{
				name = 'nvim_lsp',
				keyword_length = 2,
				max_item_count = 10,
			},
			{
				name = 'buffer',
				keyword_length = 5,
				max_item_count = 3,
				option = {
					get_bufnrs = function()
						local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
						return vim.tbl_keys(bufs)
					end,
				},
			},
		}),
		experimental = {
			ghost_text = true,
			native_menu = true,
		},
	})
end


M.use = function()
	use { 'hrsh7th/cmp-nvim-lsp', opt = false }
	use { 'hrsh7th/cmp-buffer', opt = false }
	use {
		'L3MON4D3/LuaSnip',
		config = function()
			require('snippets').setup()
		end,
		opt = false,
	}
	use { 'saadparwaiz1/cmp_luasnip', opt = false }
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require('plugins.plugin.cmp').setup()
		end,
		opt = false,
	}
end

return M
