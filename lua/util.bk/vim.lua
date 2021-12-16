local M = {}

M.termcode = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

return M
