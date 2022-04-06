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

local M = {}

table.insert(M, s('fc', {
	fmt('const {}: {} = {}', {
		i(1),
		i(2),
		i(0),
	})
}))

return M
