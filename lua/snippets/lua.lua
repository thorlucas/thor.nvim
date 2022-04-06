local ls = require("luasnip")

local M = {}

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

local cap = function(pos)
	return f(function(_, snip) return snip.captures[pos] end, {})
end

local munch = function(str, re)
	local ms, me, token = string.find(str, '^%s*('..re..')')

	if not ms or me == 0 then return nil, str end
	if ms then return token, string.sub(str, me+1) end
end

table.insert(M, s({
	trig = '([%w_]+).fn',
	regTrig = true,
	docTrig = 'M.fn',
	hidden = true,
	name = 'module function',
	}, {
		f(function(args)
			local str = args[1][1]

			local params = {}
			while true do
				local param = {'---@param'}
				table.insert(params, param)

				local name, sep, ty
				name, str = munch(str, '[%w_]+')
				if not name then break end
				param[2] = name
				
				sep, str = munch(str, ':')
				if sep == ':' then
					ty, str = munch(str, '[%w_]+')
					if not ty then break end
					param[3] = ty
				end

				sep, str = munch(str, ',')
				if not sep then break end
			end

			local out = {}
			for _, p in ipairs(params) do
				table.insert(out, vim.fn.join(p, ' '))
			end
			if #out ~= 0 then
				table.insert(out, '')
			end

			return out
		end, {2}),
		cap(1), t'.', i(1, 'fn'), t' = ',
		t('function('), i(2), t({')',
		'	'}), i(0), t({'', 
		'end'})
	}
))

table.insert(M, s(
	'mod',
	fmta([[
		local M = {}
		
		<>

		return M
	]], { i(0) })
))

table.insert(M, s(
	'class',
	fmta([[
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
))

return M
