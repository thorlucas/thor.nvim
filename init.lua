local config = require('config') {
	debug = true,
	theme = 'catppuccin',
}

if config.debug then
	function P(...)
		print(vim.inspect(...))
	end

	function R(...)
		return require(...)
	end
end

require('plugins').setup()
