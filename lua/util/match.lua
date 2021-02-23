local M = {}

local lyaml = require 'lyaml'

function M.get_yaml()
	local endpos = vim.fn.getpos('$')
	vim.fn.setpos('.', endpos)

	local first = vim.fn.search('---')
	local second = vim.fn.search('---')

	if first ~= 1 or second <= 1 then
		return nil
	end

	local yamlstr = table.concat(vim.fn.getline(first+1, second-1), '\n')
	local yamltab = lyaml.load(yamlstr)

	return yamltab
end


return M
