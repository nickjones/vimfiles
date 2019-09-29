set encoding=utf-8
set nocompatible			" Vim mode, not Vi
call pathogen#infect()			" Load up Tim Pope's stuff
runtime bundle/vim-snipmate/after/plugin/snipMate.vim " Fix for snipMate & pathogen
syntax on
filetype plugin indent on

" colorscheme molokai

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml,html,js,css,cpp setlocal autoindent expandtab shiftwidth=2 softtabstop=2
	autocmd FileType cpp setlocal commentstring=//%s
augroup END
" Go html/template
au BufNewFile,BufRead *.tmpl setlocal filetype=html

set nu
set history=1000			" Default is only 20
"set spell				" Enable spell checking
set ruler				" This isn't default on RHEL?
set backspace=indent,eol,start          " more powerful backspacing
set laststatus=2			" Needed for powerline to show in all windows
set nowrapscan
set cursorline				" Highlight the current line
set nrformats=alpha,hex
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
hi SpellBad ctermbg=black cterm=bold,underline
hi Visual ctermbg=white
if has("gui_running")
	" Force the GUI a bit wider to accommodate the ruler
	" 80 columns + 5 for up to a 9,999 line file.
	set co=85
	set mouse=a
endif
set wildmenu				" Show list instead of just completing
set wildmode=list:longest,full		" command <Tab> completion

" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
	if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
		let spec = b:rails_root . "/script/spec"
	else
		let spec = "spec"
	end 
	let cmd = ":! " . spec . " % -cfn " . a:args
	execute cmd 
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map !s :call RunSpec("-l " . <C-r>=line('.')<CR>)<CR>
" run full rspec file
map !S :call RunSpec("")<CR>

" Map F8 to Tagbar
nmap <F8> :TagbarToggle<CR>
" Quickly pressing j followed by k while in insert mode escapes out of insert
" mode.
inoremap jk <Esc>
let mapleader=","

" Visual select, then <Enter> to start EasyAlign mode
vmap <Enter> :EasyAlign<CR>
nmap <Leader>a :EasyAlign<CR>

map ;n			:tabnew<CR>
map ;h			:tabp<CR>
map ;l			:tabn<CR>
map <Leader>f 		:call ToggleFolding()<CR>
map <Leader>wide  	:set co=150<CR>
map <F5>		:%s/\s\+$//g<CR>

noremap <Leader>bfont :set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 18<CR>
noremap <Leader>rfont :set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 13<CR>

cabbrev bonly WSBufOnly

function! ToggleFolding()
	if(&l:foldmethod == "manual")
		setlocal foldmethod=indent
		execute "%foldclose"
	else
		setlocal foldmethod=manual
		execute "%foldopen"
	endif
endfunction


" Too slow on huge repositories
let g:gitgutter_realtime = 0

" Presentation colors and config
" (http://vim.devth.com/?tag=colorscheme)
function! PresentationMode()
	colorscheme github
	set bg=light
	set nolist
endfunction
nmap <leader>PR :call PresentationMode()<cr>

highlight ShowTrailingWhitespace ctermbg=red guibg=red

" EasyAlign for C-style comments
let g:easy_align_delimiters = {
\ '/': {
\      'pattern':	'//\+\|/\*\|\*/',
\      'delimiter_align': 'l',
\      'ignore_groups':   ['!Comment']
\  }
\ }
let g:easy_align_delimiters['d'] = {
\ 'pattern': ' \ze\S\+\s*[;=]',
\ 'left_margin': 0,
\ 'right_margin': 0
\ }

" Folding
set foldminlines=5
set foldmethod=marker

" Fix for Ubuntu terminal windows with gray backgrounds even though
" vividchalk explicitly sets a black one.
"au VimEnter * colorscheme vividchalk

" Prevent automatic go downloads
let g:go_disable_autoinstall = 1
let g:airline_theme='wombat'
set tabpagemax=100
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:bookmark_auto_save = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 3
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
" for when gofmt is too slow on every save for NFS
" let g:go_fmt_autosave = 1


call rainbow_parentheses#activate()
