" Plug {{
	call plug#begin(stdpath('data') . '/plugged')
	
	" Color scheme and aesthetics {{
		Plug 'ayu-theme/ayu-vim'
		Plug 'vim-airline/vim-airline'
		Plug 'kyazdani42/nvim-web-devicons'
	" }}
	
	" Editor {{
		Plug 'kyazdani42/nvim-tree.lua'
	" }}
	
	call plug#end()
" }}

" General settings {{
	set confirm
	set timeoutlen=200
" }}

" Color scheme and aesthetics {{
	" Tabs {{
		set list listchars=tab:\│\ 
		set noexpandtab
		set tabstop=4
		set softtabstop=4
		set shiftwidth=4
	" }}
	
	" Colorscheme {{
		set termguicolors
		let ayucolor="mirage"
		colorscheme ayu
		highlight EndOfBuffer guifg=bg
		highlight VertSplit guifg=bg
	" }}
	
	" Airline {{
		let g:airline#extensions#tabline#enabled = 1
		let g:airline_powerline_fonts = 1
	" }}
" }}

" Editor {{
	" LuaTree {{
		let g:lua_tree_auto_open = 1
		let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ]
		let g:lua_tree_tab_open = 1
		let g:lua_tree_indent_markers = 1
		
		nnoremap <C-n> :LuaTreeToggle<CR>
	" }}
" }}

" General keybindings {{
	" ev -> open init.vim, sv -> source init.vim {{
		nnoremap <leader>ev :vsplit $MYVIMRC<CR>
		nnoremap <leader>sv :source $MYVIMRC<CR>
	" }}
	
	" jk -> esc {{
		inoremap jk <esc>
		vnoremap jk <esc>
	" }}
	
	" alt + arrow keys -> switch windows {{
		nnoremap <silent> <A-Up> <C-w>k
		nnoremap <silent> <A-Down> <C-w>j
		nnoremap <silent> <A-Left> <C-w>h
		nnoremap <silent> <A-Right> <C-w>l
	" }}
" }}
