"=========================================================== General settings =
syntax on

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
set sidescrolloff=0
set relativenumber
set laststatus=2
set title
set showcmd
set background=dark
set showmatch                   " shows matching part of bracket pairs (), [], {}
"set autochdir 					" Update the dir everytime change files

"========================================================== Tabs & Indentation =

set tabstop=4
set shiftwidth=4
set smartindent

" ================================================= C Programming Autocomplete =
set complete=.,w,b,u,t,i
set tags=./tags;,tags;
"autocmd FileType c setlocal path+=/usr/include
autocmd FileType c setlocal complete+=i

set ttyfast                     " terminal acceleration
set clipboard=unnamed           " use system clipboard
set wildmenu                    
set wildmode=longest:full,full
set shell=/usr/bin/bash\ -i
"set splitright
set splitbelow
set fillchars=vert:\ ,eob:\ 
set t_vb=

" ===================================================================== Remaps =

let mapleader =  " "

" Netrw config
let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 0
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
let g:netrw_sort_sequence = '[\/]$,*,\.bak$,\.o$,\.h$,\.info$,\.swp$,\.obj$'

" Toggle netrw
nnoremap <leader>fe :Ex<CR>

inoremap jk <ESC>

nnoremap <leader>rr :source ~/.vimrc<CR>
nnoremap <leader>sr :e ~/.vimrc<CR>
nnoremap <leader>if mzgg=G`z
nnoremap <leader><leader> /

nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :q<CR>

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
nnoremap <leader>ov :vert term <CR>
nnoremap <leader>os :term <CR>
"nnoremap <leader>ob :!gnome-terminal -- bash & <CR>
nnoremap <leader>ob :!xterm -fa 'Monospace' -fs 10 -e bash &<CR>

tmap <Esc> <C-\><C-n> " Escape terminal input mode using Esc key

" Yank to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

augroup MyCustomHighlights
    autocmd!
    autocmd ColorScheme * call s:MyHighlights()
    autocmd VimEnter * call s:MyHighlights()
    autocmd BufWinEnter * call s:MyHighlights()
augroup END

function! s:MyHighlights()
    execute 'highlight Normal       ctermfg=248 ctermbg=235'
    execute 'highlight LineNr       ctermfg=240'
    execute 'highlight Constant     ctermfg=75  ctermbg=235'
    execute 'highlight Comment      ctermfg=240 gui=italic'
    execute 'highlight Error        ctermfg=210 gui=bold'
    execute 'highlight Function     ctermfg=96'
    execute 'highlight Type         ctermfg=65'
    execute 'highlight Special      ctermfg=65'
    execute 'highlight Identifier   ctermfg=138'
    execute 'highlight Keyword      ctermfg=130 gui=bold'
    execute 'highlight String       ctermfg=65'
    execute 'highlight Number       ctermfg=138'
    execute 'highlight Directory    ctermfg=96'
    execute 'highlight VertSplit	ctermfg=235'
    execute 'highlight Statement    ctermfg=130'
    execute 'highlight StatusLine   ctermfg=65  ctermbg=234'
    execute 'highlight StatusLineNC ctermfg=240  ctermbg=234'
    execute 'highlight NormalNC     ctermfg=130 ctermbg=235'
    execute 'highlight netrwDir     ctermfg=130'
endfunction

" Trigger once on startup manually
call s:MyHighlights()

