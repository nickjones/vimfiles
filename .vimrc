set nocompatible
syntax on
filetype on
filetype indent on
call pathogen#infect()
filetype plugin indent on
"color murphy
color vividchalk
autocmd FileType rb setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType erb setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType js setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
set autoindent
set nu
"set foldmethod=syntax
