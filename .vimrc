
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
set tabstop=4
set shiftwidth=4
set ttyfast                     " terminal acceleration
set showmatch                   " shows matching part of bracket pairs (), [], {}
set clipboard=unnamed           " use system clipboard
set shell=/usr/bin/fish
set splitright

let mapleader =  " "

inoremap jk <ESC>

nnoremap <leader>rr :source ~/.vimrc<CR>

nnoremap <leader>= mzgg=G`z

vnoremap <leader>y "+y
nnoremap <leader>y "+yy


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

set fillchars=vert:│
highlight VertSplit cterm=NONE ctermfg=black ctermbg=NONE
highlight Normal guibg=#343541 guifg=#d4d4d4

noremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>


packadd termdebug
nnoremap <leader>gdb :Termdebug ./a.out<CR>

nnoremap <leader>tv :vert term <CR>
nnoremap <leader>th :term <CR>

" Escape terminal input mode using Esc key
tmap <Esc> <C-\><C-n>

" Muted green color: #6A9B58 or #4C8C43 (you can tweak it)
highlight Function  guifg=#6A9B58 ctermfg=65
highlight Type      guifg=#6A9B58 ctermfg=65
highlight Special   guifg=#6A9B58 ctermfg=65
highlight PreProc   guifg=#6A9B58 ctermfg=65
highlight Comment 	guifg=#5a5a5a ctermfg=242
highlight LineNr 	guifg=#800a80 ctermfg=130
highlight Statement guifg=#DFA41A ctermfg=130
highlight vimvar 	guifg=#DFA41A ctermfg=140
highlight netrwDir 	guifg=#DFA41A ctermfg=140

" Status line: dark bg with muted green fg
highlight StatusLine   guifg=#4CAF50 guibg=#121212 ctermfg=65 ctermbg=234
" Status line inactive (for split windows)
highlight StatusLineNC guifg=#444444 guibg=#121212 ctermfg=240 ctermbg=234

