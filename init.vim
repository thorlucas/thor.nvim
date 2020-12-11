" Plug {{
call plug#begin(stdpath('data') . '/plugged')

" Util {{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'yggdroot/indentline'
"Plug 'jiangmiao/auto-pairs'
" }}

" Wiki {{
Plug 'vimwiki/vimwiki'
Plug '~/Dropbox/Projects/Programming/Vim/vimchem'
"Plug 'michal-h21/vim-zettel'
"Plug 'itchyny/calendar.vim'
" }}

" Language {{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
"Plug 'mattn/emmet-vim'
" }}

" Editor / Aesthetic {{
Plug 'ayu-theme/ayu-vim'
"Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
"Plug 'ryanoasis/vim-devicons'
" }}

call plug#end()
" }}

" Settings {{
" TODO: ???
let mapleader="\\"

set termguicolors
set fillchars=""
set foldlevel=20
set linebreak
set wildmenu
set confirm
"set visualbell
set showmatch
set updatetime=250
set list lcs=tab:\│\ 
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set timeoutlen=200

filetype plugin on
syntax on

set number relativenumber
augroup number_toggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
" }}

" Color scheme and Aesthetics {{
let ayucolor="mirage"
colorscheme ayu

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

au User AirlineAfterInit,AirlineAfterTheme call FixSplitColours()
fun! FixSplitColours()
    let l:theme = get(g:, 'airline_theme', g:colors_name)
    let l:termColour = g:airline#themes#{l:theme}#palette['inactive']['airline_a'][3]
    exec 'hi VertSplit ctermfg=' . l:termColour . ' ctermbg=' . l:termColour
    exec 'hi StatusLine ctermfg=' . l:termColour
    exec 'hi StatusLineNC ctermfg=' . l:termColour
endfun

"highlight VertSplit ctermfg=4 ctermbg=0 guifg=#36A3D9 guibg=#151a1e
highlight StatusLine guibg=bg
highlight StatusLineNC guibg=bg
highlight EndOfBuffer guifg=bg
highlight SignColumn guibg=bg
highlight CursorLineNr guibg=bg
" }}

" NERDTree {{
"augroup nerdtree
	"autocmd!
	"autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"augroup END

"nnoremap <C-n> :NERDTreeToggle<CR>

"let g:NERDTreeStatusline = "NERD"
"let NERDTreeMinimalUI = 1

"if exists('g:loaded_webdevicons')
    "call webdevicons#refresh()
"endif
"}}

" LuaTree {{
let g:lua_tree_auto_open = 1
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:lua_tree_tab_open = 1
nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>
" }}

" GitGutter {{
let g:gitgutter_sign_column_always = 1
"}}

" CoC {{

" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
inoremap <silent><expr> <cr> complete_info()["selected"] != "-1" ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" }}

" IndentLine {{
"let g:indentLine_char = '│'
"let g:indentLine_setColors = 0
" }}

" AutoPairs {{
"let g:AutoPairsFlyMode = 1
"let g:AutoPairs = {'[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
"}}

" Emmet {{
"let g:user_emmet_install_global = 0
"let g:user_emmet_leader_key='\'
"autocmd FileType html,css,php,jinja2 EmmetInstall
" }}

" Fzf {{
silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
	nnoremap <leader><Tab> :GFiles<CR>
else
	nnoremap <leader><Tab> :Files<CR>
end
" }}

" VimWiki and Vim-Zettel {{
let g:vimwiki_list = [{
\	'path': '~/Dropbox/Wiki/',
\	'path_html': '~/Dropbox/Wiki_HTML/',
\	'syntax': 'markdown',
\	'ext': '.md',
\	'custom_wiki2html': '~/.local/share/nvim/scripts/wiki2html.sh',
\ }]
let g:vimwiki_key_mappings = {
\	'all_maps': 1,
\	'global': 1,
\	'headers': 1,
\	'text_objs': 1,
\	'table_format': 0,
\	'table_mappings': 0,
\	'lists': 1,
\	'links': 1,
\	'html': 1,
\	'mouse': 0,
\}
let g:vimwiki_use_calendar = 1
"let g:zettel_options = [{
"\	"front_matter" : [
"\		["tags", ":hello:"]
"\	]
"\ }]
"let g:zettel_format = "%y%m%d-%H%M-%title"
"let g:zettel_default_mappings = 0
"let g:zettel_fzf_command = "rg --column --line-number --no-heading --color=always --smart-case --with-filename -- "

"nmap <leader>zo :ZettelOpen<CR>title:<space>

augroup filetype_vimwiki
	autocmd!
	" Disable [ pair completion so that [[ works
	autocmd FileType vimwiki let b:coc_pairs_disabled = ['[']
	" Maps [[ in buffer to open zettel search for a title 
	"autocmd FileType vimwiki imap <buffer> <silent> [[ [[jk<Plug>ZettelSearchMap#<space>
augroup END

" }}

" Calendar {{
"augroup filetype_calendar
	"autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>
"augroup END
" }}

" Vimchem {{
cnoreabbrev Smi VimchemSearchProduct
cnoreabbrev Rxn VimchemSearchReaction
" }}

" Folding {{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker foldmarker={{,}}
" }}

" Vimtex {{
let g:vimtex_compiler_method = "vimtex-tectonic"
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
" }}

" Quality of life {{

" Maps W to w since I always accidentally type W
command! W w

" Maps tab and shift tab to next and previous suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

" Maps window switching to alt + arrow keys
nnoremap <silent> <A-Up> <C-w>k
nnoremap <silent> <A-Down> <C-w>j
nnoremap <silent> <A-Left> <C-w>h
nnoremap <silent> <A-Right> <C-w>l

" Maps tab and shift tab in select mode so that we can tab through parameters
smap <Tab> <C-j>
smap <S-Tab> <C-k>

" Maps to open init.vim in a split pane for quick changes
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Fun abbreviations
iabbrev ccopy Copyright 2020 Thor Lucas Correia, all rights reserved.

" jk -> <esc>
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap jk <esc>
vnoremap <esc> <nop>

" Leave search
nnoremap <leader>/ :nohlsearch<Cr>

" }}

