"============================================================ General settings =
syntax on
filetype on

set path+=**
set mouse=a
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
set sidescrolloff=10
set relativenumber
set laststatus=2
set title
set showcmd
set background=dark
set showmatch                   " shows matching part of bracket pairs (), [], {}
set autochdir 					" Update the dir everytime change files

"========================================================== Tabs & Indentation =

set tabstop=4
set shiftwidth=4
set smartindent

" ================================================= C Programming Autocomplete =
set complete=.,w,b,u,t,i
set tags=./tags;,tags;
autocmd FileType c setlocal path+=/usr/include
autocmd FileType c setlocal complete+=i

set ttyfast                     " terminal acceleration
set clipboard=unnamed           " use system clipboard
set wildmenu                    
set wildmode=longest:full,full
set shell=/usr/bin/bash\ -i
set splitright
set splitbelow
set fillchars=vert:│
set fillchars=eob:\ 

" ===================================================================== Remaps =

let mapleader =  " "

inoremap jk <ESC>

nnoremap <leader>rr :source ~/.vimrc<CR>
nnoremap <leader>sr :e ~/.vimrc<CR>
nnoremap <leader>= mzgg=G`z
nnoremap <leader><leader> /

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>of :e **/*
nnoremap <leader>om :topleft vert term man 

nnoremap <leader>ff :find *

nnoremap <leader>cw :%s/\<<C-r><C-w>\>//gI<Left><Left><Lefth
vnoremap <leader>c :s/^/\/\/ /<CR>
vnoremap <leader>u :s/^\/\/\s\?//<CR>

packadd termdebug
nnoremap <leader>gdb :Termdebug ./a.out<CR>
nnoremap <leader>tv :vert term <CR>
nnoremap <leader>th :term <CR>
nnoremap <leader>ob :!gnome-terminal -- bash & <CR>

tmap <Esc> <C-\><C-n> " Escape terminal input mode using Esc key

" ================================================================ Colorscheme =
highlight Function  ctermfg=65
highlight Type      ctermfg=65
highlight Special   ctermfg=65
highlight PreProc   ctermfg=65
highlight Comment 	ctermfg=240
highlight LineNr 	ctermfg=240
highlight Statement ctermfg=130
highlight vimvar 	ctermfg=140
highlight netrwDir 	ctermfg=140
highlight normal 	ctermfg=250
highlight Pmenu      ctermfg=white ctermbg=darkgray guifg=#eeeeee guibg=#3a3a3a
highlight PmenuSel   ctermfg=black ctermbg=lightgray guifg=#000000 guibg=#aaaaaa
highlight StatusLine   ctermfg=65 ctermbg=234
highlight StatusLineNC guifg=#444444 guibg=#121212 ctermfg=240 ctermbg=234
highlight VertSplit cterm=NONE ctermfg=black ctermbg=NONE
highlight Normal guibg=#343541 guifg=#d4d4d4
