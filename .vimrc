syntax enable

colorscheme molokai

set number
set cursorline

set incsearch
set hlsearch

set ts=4 sw=4

set backspace=indent,eol,start

set autoindent

" pathogen package manager
execute pathogen#infect()

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline_skip_empty_sections = 1

