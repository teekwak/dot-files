set nocompatible
set t_Co=256
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set relativenumber
set lazyredraw

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

colorscheme gruvbox
set background=dark

" automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" fzf
nnoremap <C-p> :FZF<CR>

" vim-javascript
let g:javascript_plugin_flow=1

" vim-gitgutter
set updatetime=100

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

