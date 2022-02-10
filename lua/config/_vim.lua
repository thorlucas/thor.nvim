return {
	opts = {
		---- MISC ----
		-- allows buffers to hidden and unsaved (for example, when you rename something
		-- using LSP)
		hidden = true,	
		-- allows tab in command input
		wildmenu = true,
		-- confirms if you want to do options that would normally fail (like quit without
		-- saving)
		confirm = true,
		-- flashes the matching open brace when you close a brace
		showmatch = true,
		-- avoids the annoying long messages
		shortmess = vim.o.shortmess .. "c",


		---- FOLDS ----
		-- commented out because I want to get LSP folding
		foldlevel = 20,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",


		---- APPEARANCE -----
		-- enables 24 bit color
		termguicolors = true,
		-- allows wrap before the end of the screen
		linebreak = true,
		-- 88 columns before break
		textwidth = 88,
		-- fill whitespace in gui
		-- end of buffer: nothing
		-- vertical separator: nothing
		fillchars = [[eob:\ ,vert:\ ]],
		-- without list, the cursor appears at the end of tabs (and other weird things)
		list = true,
		-- what to fill the list with
		-- tab: vertical bar
		listchars = [[tab:\│\ ]],
		-- shows line number in the sign column
		signcolumn = "number",
		-- highlights curent line
		cursorline = true,


		---- TABS ----
		-- keep tabs, always!!!
		expandtab = false,
		-- 1 tab = 4 spaces
		tabstop = 4,
		softtabstop = 4,
		-- every time you hit indent, shifts this many spaces
		shiftwidth = 4,


		---- TIMEOUT ----
		-- ms before timing out keymap
		timeoutlen = 200,
		updatetime = 250,
		

		---- LINE NUMBER ----
		-- enables line numbers
		number = true,
		-- line numbers are relative to the cursor
		relativenumber = true,


		---- COMPLETION ----
		completeopt = "menu,menuone,noselect",
	},
	cmds = {
		-- enable syntax highlighting
		syntax = "enable",

		-- enable filetype detection
		-- load plugins based on filetype 
		-- load indent info basedo on filetype
		filetype = "plugin indent on",

		-- allows relative line numbers in normal mode, but absolute in insert mode
		-- I can't get this to not do its thing in nerdtree
-- 		[[
-- 			augroup number_toggle
-- 			autocmd!
-- 			autocmd BufEnter,FocusGained,InsertLeave * if !(&ft ==? "NerdTree") | set relativenumber | endif
-- 			autocmd BufLeave,FocusLost,InsertEnter * if !(&ft ==? "NerdTree") | set norelativenumber | endif
-- 			augroup END
-- 		]],
	}
}
