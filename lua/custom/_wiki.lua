local M = {}
_G.thor.wiki = {}

function M.get_current_subdir()
	local wiki_nr = vim.fn['vimwiki#vars#get_bufferlocal']('wiki_nr')
	if wiki_nr == -1 then
		local cur_dir = vim.fn.expand('%:p:h')
		return cur_dir..'/'
	end

	local wiki_dir = vim.fn['vimwiki#vars#get_wikilocal']('path')
	local cur_subdir = vim.fn['vimwiki#vars#get_bufferlocal']('subdir')

	return wiki_dir..cur_subdir
end

function M.get_current_figure_dir()
	local figure_dir = M.get_current_subdir()..'Figures/'
	vim.fn.execute("!mkdir -p "..vim.fn.fnameescape(figure_dir), "silent")

	return figure_dir
end

function M.get_figure_template_path()
	return vim.fn.stdpath('data')..'/thor/template.cdxml'
end

function M.figure_exists(name)
	local path = M.get_current_figure_dir()..name
	print("path: "..path)

	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function M.get_default_figure_name(test_ext)
	test_ext = test_ext or 'svg'
	local num = 1
	while true do
		local name = 'figure_'..num
		if not M.figure_exists(name..'.'..test_ext) then
			return name
		else
			num = num + 1
		end
	end
end

function M.launch_figure_editor(figure_path)
	vim.fn.execute([[!osascript -e 'tell application "Keyboard Maestro Engine" to do script "Edit Figure" with parameter "']]..vim.fn.fnameescape(figure_path)..[['"']], "silent")
end

function M.copy_figure_template(figure_root)
	local figure_path = figure_root..".cdxml"
	vim.fn.execute("!cp "..vim.fn.fnameescape(M.get_figure_template_path()).." "..vim.fn.fnameescape(figure_path))
	return figure_path
end

function _G.thor.wiki.get_current_figure_dir()
	return M.get_current_figure_dir()
end

function _G.thor.wiki.edit_new_default_figure(ext)
	ext = ext or 'svg'
	print("ext: "..ext)

	local figure_name = M.get_default_figure_name(ext)
	print("figure name: "..figure_name)
	local figure_root = M.get_current_figure_dir()..figure_name
	print("figure root: "..figure_root)
	local figure_path = M.copy_figure_template(figure_root)
	print("figure path: "..figure_path)
	M.launch_figure_editor(figure_path)
	return 'Figures/'..figure_name..'.'..ext
end

return M
