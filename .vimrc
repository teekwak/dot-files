set nocompatible
set t_Co=256
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set relativenumber
set hidden
set lazyredraw

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" aliases
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

silent! colorscheme gruvbox
set background=dark

" ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

" automatically remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" vim-gitgutter
set updatetime=100

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_section_y=''

" stupid indenting during insert mode
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:
