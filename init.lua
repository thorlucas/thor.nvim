--if config.debug then
	--function P(...)
		--print(vim.inspect(...))
	--end

	--function R(...)
		--return require(...)
	--end
--end

require('bootstrap').autoload {
	'config',
	'plugins',
}
