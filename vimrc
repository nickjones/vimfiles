set encoding=utf-8
set nocompatible			" Vim mode, not Vi
call pathogen#infect()			" Load up Tim Pope's stuff
runtime bundle/vim-snipmate/after/plugin/snipMate.vim " Fix for snipMate & pathogen
syntax on
filetype plugin indent on

colorscheme molokai

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml,html,js,css,cpp setlocal autoindent expandtab shiftwidth=2 softtabstop=2
augroup END
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

" Presentation colors and config
" (http://vim.devth.com/?tag=colorscheme)
function! PresentationMode()
	colorscheme github
	set bg=light
	set nolist
endfunction
nmap <leader>PR :call PresentationMode()<cr>

highlight ShowTrailingWhitespace ctermbg=red guibg=red

" Fix for Ubuntu terminal windows with gray backgrounds even though
" vividchalk explicitly sets a black one.
"au VimEnter * colorscheme vividchalk
