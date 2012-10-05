set nocompatible			" Vim mode, not Vi
syntax on
filetype plugin indent on
call pathogen#infect()			" Load up Tim Pope's stuff

colorscheme koehler

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml,html,js,css,cpp setlocal autoindent expandtab shiftwidth=2 softtabstop=2
augroup END
set nu
set history=1000			" Default is only 20
"set spell				" Enable spell checking
set ruler				" This isn't default on RHEL?
set backspace=indent,eol,start          " more powerful backspacing
if has("gui_running")
	set cursorline			" Highlight the current line
	hi cursorline guibg=#333333
	hi CursorColumn guibg=#333333

	" Force the GUI a bit wider to accommodate the ruler
	" 80 columns + 5 for up to a 9,999 line file.
	set co=85
	set mouse=a
else
	" Fix up the colors for bad spelling in Vim mode with Rxvt colors
	" and vividchalk.
	hi SpellBad ctermbg=black cterm=bold,underline
endif
set wildmenu				" Show list instead of just completing
set wildmode=list:longest,full		" command <Tab> completion

" Add various extensions for Verilog and SystemVerilog
augroup filetypedetect
    au BufRead,BufNewFile *.v,*.vh,*.tpl setfiletype verilog
    au BufRead,BufNewFile *.v,*.vh,*.tpl set expandtab tabstop=4 softtabstop=2 shiftwidth=2
    au BufRead,BufNewFile *.sv,*.svi,*.svh set filetype=verilog_systemverilog
    au BufRead,BufNewFile *.sv,*.svi,*.svh set expandtab tabstop=4 softtabstop=2 shiftwidth=2
augroup END

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

" Presentation colors and config
" (http://vim.devth.com/?tag=colorscheme)
function! PresentationMode()
	colorscheme github
	set bg=light
	set nolist
endfunction
nmap <leader>PR :call PresentationMode()<cr>

" Fix for Ubuntu terminal windows with gray backgrounds even though
" vividchalk explicitly sets a black one.
"au VimEnter * colorscheme vividchalk
