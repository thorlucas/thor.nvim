local M = {}

vim.g.copilot_filetypes = { ["*"] = false }

M.toggle_copilot = function()
	if vim.b.copilot_enabled then
		vim.b.copilot_enabled = false
	else
		vim.b.copilot_enabled = true
	end
end

return M
