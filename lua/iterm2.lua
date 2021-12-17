-- Lets me fuck with some iTerm2 shit
local Job = require'plenary.job'

local M = {}

-- fg bg bold link selbg selfg curbg curfg
M.set_color = function(target, color)
	Job:new({
		command = 'it2setcolor',
		args = { target, color },
	}):sync()
end

return M
