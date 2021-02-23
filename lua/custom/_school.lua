_G.thor.school = {}

local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

_G.thor.school.courses = "/Users/thorcorreia/Dropbox/Projects/School/Berkeley";
_G.thor.school.current_course = "/Users/thorcorreia/Dropbox/Projects/School/Current";

local function switch_to_course(course)
	print(course)
	vim.fn.execute('!rm \''.._G.thor.school.current_course..'\'', "silent")
	vim.fn.execute('!ln -s \''..course..'\' \''.._G.thor.school.current_course..'\'', "silent");
end

function _G.thor.school.select_course(opts)
	local find_command = { 'find', _G.thor.school.courses, '-type', 'd', '-depth', '1' }

	opts = opts or {}
	opts.entry_maker = opts.entry_maker or function(entry)
		return {
			value = entry,
			display = string.match(entry, [[.*/(.+)$]]),
			ordinal = entry,
		}
	end

	pickers.new(opts, {
		prompt_title = "Select a course",
		results_title = "Courses",
		finder = finders.new_oneshot_job(
			find_command,
			opts
		),
		sorter = conf.file_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.goto_file_selection_edit:replace(function()
				local course = actions.get_selected_entry(prompt_bufnr).value
				switch_to_course(course)
				actions.close(prompt_bufnr)
			end)
			return true
		end
	}):find()
end

vim.cmd('set rtp+='.._G.thor.school.current_course)
