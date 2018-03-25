syntax enable

set number
set cursorline
set incsearch
set hlsearch
set ts=4 sw=4
set backspace=indent,eol,start
set autoindent
set relativenumber

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" aliases
nmap <leader>tree :NERDTree<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

colorscheme molokai

"ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*

" nerdtree
let NERDTreeShowHidden=1

" vim-javascript
let g:javascript_plugin_flow=1

" vim-gitgutter
set updatetime=100

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline_skip_empty_sections=1

