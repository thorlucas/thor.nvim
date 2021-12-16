local M = {}

vim.g.copilot_filetypes = { ["*"] = false }

M.toggle_copilot = function()
	if vim.b.copilot_enabled then
		vim.g.copilot_filetypes[vim.bo.filetype] = false
		vim.b.copilot_enabled = false
	else
		vim.g.copilot_filetypes[vim.bo.filetype] = true
		vim.b.copilot_enabled = true
	end
end

return M
