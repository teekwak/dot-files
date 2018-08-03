set t_Co=256
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set lazyredraw
set nowrap

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
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

" nerdtree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" vim-javascript
let g:javascript_plugin_flow=1

" vim-gitgutter
set updatetime=100

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline_skip_empty_sections=1

