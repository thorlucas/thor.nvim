_G.test_handler = function(err, result, ctx, config) 
	if err then
		vim.notify(vim.inspect(err), 4)
		return
	end
	print(vim.inspect(result))
	print(vim.inspect(ctx))
end

local function pack(...)
	return {...}
end

_G.test_set_mark = function()
	local to = require('nvim-treesitter.textobjects.shared')
	local a = pack(to.textobject_at_point('@function.outer'))
	local range = a[2]
	print(vim.inspect(range))

	local row, col, end_row, end_col = unpack(range)

	local ns = vim.api.nvim_get_namespaces()['testy'] or vim.api.nvim_create_namespace('testy')

	vim.api.nvim_buf_set_extmark(0, ns, row, col, {
		hl_group = 'TSNote',
		end_row = end_row,
		end_col = end_col,
		virt_text = {{'test!', 'GlyphPalette1'}},
		virt_text_pos = 'eol'                                
	})                                                      
end

local hex_ns = vim.api.nvim_get_namespaces()['hex'] or vim.api.nvim_create_namespace('hex')

-- Consumes a combination of hashes and and alphanumeric characters. If it is a valid
-- hex, returns it. Always also returns the number of consumed characters.
local match_hex = function(line)
	local total_idx = 0

	while true do
		local idx, consumed = string.find(line, '[#%w]+')
		if not idx then return nil end
		idx = idx - 1
		local len = consumed - idx
		
		local possible = string.sub(line, idx + 1, consumed)	
		line = string.sub(line, consumed + 1)

		total_idx = total_idx + idx
		local match = string.find(possible, '^#%x%x%x%x%x%x$')

		if match then
			return total_idx, len, possible, line
		else
			total_idx = total_idx + len
		end
	end

	return nil
end

local hex_handler = function(_, buf, _, start_line, old_end_line, new_end_line)
	local lines = vim.api.nvim_buf_get_lines(buf, start_line, new_end_line, true)
	print(vim.inspect(lines))
	local exts = vim.api.nvim_buf_get_extmarks(buf, hex_ns, {start_line, 0}, {old_end_line, 0}, { details = true })
	print(vim.inspect(exts))

	local iter, ext_idx, ext
	iter, exts, ext_idx = ipairs(exts)
	ext_idx, ext = iter(exts, ext_idx)

	for l_off, line in ipairs(lines) do
		local l_idx = l_off + start_line - 1
		local c_idx = 0

		while true do
			local hex_offset, len, hex, tail = match_hex(line)
			if not hex_offset then break end
			line = tail

			local hex_col, hex_line = (c_idx + hex_offset), l_idx
			c_idx = c_idx + len

			print("matched hex "..hex.." at "..vim.inspect({hex_line, hex_col}))

			-- while we don't match the exts, pop them off and create new ones
			while ext and ext[2] <= hex_line and ext[3] < hex_col do
				print("removing incorrect ext @ "..vim.inspect(ext))
				vim.api.nvim_buf_del_extmark(buf, hex_ns, ext[1])
				ext_idx, ext = iter(exts, ext_idx)
			end

			if ext and ext[2] == hex_line and ext[3] == hex_col then
				-- if matches, continue
				-- TODO: if our hex value changed, update it
				print("passing correct ext @ "..vim.inspect(ext))
				ext_idx, ext = iter(exts, ext_idx)
			else
				-- if no match, we have a new one
				print("creating new ext @ "..vim.inspect({hex_line, hex_col}))
				vim.api.nvim_buf_set_extmark(0, hex_ns, hex_line, hex_col, {
					hl_group = 'GlyphPalette3',
					end_row = l_idx,
					end_col = hex_col + len,
					virt_text = {{'●', 'GlyphPalette3'}},
					virt_text_pos = 'eol'
				})
			end
		end
	end 

	-- any remaining exts dont belong
	while ext do
		print("removing incorrect ext @ "..vim.inspect(ext))
		vim.api.nvim_buf_del_extmark(buf, hex_ns, ext[1])
		ext_idx, ext = iter(exts, ext_idx)
	end
end

_G.hex_preview = function()
	vim.api.nvim_buf_attach(0, false, {
		on_lines = hex_handler
	})
end

_G.hex_clear = function()
	vim.api.nvim_buf_clear_namespace(0, hex_ns, 0, -1)
end

vim.api.nvim_set_keymap('n', '<leader>t', [[<Cmd>lua _G.test_set_mark()<CR>]], {
	noremap = true,
	silent = true,
})
