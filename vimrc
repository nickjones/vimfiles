set nocompatible			" Vim mode, not Vi
syntax on
filetype plugin indent on
call pathogen#infect()			" Load up Tim Pope's stuff
color vividchalk
augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml,html,js,css setlocal autoindent expandtab shiftwidth=2 softtabstop=2
augroup END
set nu
set history=1000			" Default is only 20
set spell				" Enable spell checking
if has("gui_running")
  set cursorline			" Highlight the current line
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
else
  " Fix up the colors for bad spelling in Vim mode with Rxvt colors and
  " vividchalk.
  hi SpellBad ctermbg=black cterm=bold,underline
endif
set wildmenu				" Show list instead of just completing
set wildmode=list:longest,full		" command <Tab> completion
