local ls = require("luasnip")

-- [Docs](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md)

---@diagnostic disable
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
---@diagnostic enable


ls.config.setup({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = {{"●", "GlyphPalette3"}},
				hl_mode = 'combine',
			},
			passive = {
				virt_text = {{"●", "GlyphPalette7"}},
				hl_mode = 'combine',
			}
		},
		[types.insertNode] = {
			active = {
				virt_text = {{"●", "GlyphPalette4"}},
				hl_mode = 'combine',
			}
		},

	},
	ext_base_prio = 200,
	ext_prio_increase = 3,
})


local class = fmta([[
	---@class <>
	local <> = {<>}

	<>
]], {
	rep(1),
	i(1, 'MyClass'),
	i(2),
	c(3, {
		sn(nil, fmta([[
			function <>:new(o)
				o = o or {}
				setmetatable(o, self)
				self.__index = self
				return o
			end
		]], {
			i(1, 'MyClass')
		})),
		t''
	}),
})

local cap = function(i)
	return f(function(_, snip) return snip.captures[i] end, {})
end

local modfunc = s({
	trig = '([%w_]+).fn',
	regTrig = true,
	docTrig = 'M.fn',
	name = 'module function',
	}, {
		cap(1), t'.', i(1, 'fun'), t' = function(', i(2), t({')', 
		'	'}), i(0), t({'',
		'end'})
})

ls.snippets = {
	lua = {
		s('class', class),
		modfunc,
	},
}
