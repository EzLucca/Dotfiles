
syntax on

set mouse=a
set wildmenu                    
set noerrorbells                
set nu
set nowrap
set smartcase
set noswapfile                  " no swap file
set nobackup                    " no backup
set undodir=~/.vim/undodir
set undofile
set incsearch                   " incremental searching
set scrolloff=10
set relativenumber
set laststatus=2
set title
set showcmd
set background=dark
set mouse =a
set tabstop=4
set shiftwidth=4
set ttyfast                     " terminal acceleration
set showmatch                   " shows matching part of bracket pairs (), [], {}
set clipboard=unnamed           " use system clipboard

let mapleader =  "

nnoremap <leader>sf :source ~/.vimrc<CR>
nnoremap <leader>= mzgg=G`z
nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fe :Ex<CR>
nnoremap <leader>wv :vsplit <CR>
nnoremap <leader>ws :split <CR>
nnoremap <leader>wl <c-w><c-l>
nnoremap <leader>wk <c-w><c-k>
nnoremap <leader>wj <c-w><c-j>
nnoremap <leader>wh <c-w><c-h>
nnoremap <leader>wq <c-w><c-q>
nnoremap <leader>w<up> <c-W>+
nnoremap <leader>w<down> <c-W>-
nnoremap <leader>w<Right> <c-W>>
nnoremap <leader>w<Left> <c-W><

noremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>


inoremap jk <ESC>
packadd termdebug
nnoremap <leader>gdb :Termdebug ./a.out<CR>
