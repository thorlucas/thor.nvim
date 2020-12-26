local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- TODO: Hmm, I'm not sure how to get this to properly also run packer compile
-- and packer install, etc.
