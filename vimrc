"=====================================================
"" General settings
"=====================================================

syntax on

filetype on
filetype plugin on
filetype plugin indent on

set path+=**
set wildmenu                    
set noerrorbells                
set tabstop=4 
set softtabstop=4               
set shiftwidth=4
set expandtab                   " expand tabs into spaces
set smartindent                 " 
set nu
set nowrap
set smartcase
set noswapfile                  " no swap file
set nobackup                    " no backup
set undodir=~/.vim/undodir
set undofile
set incsearch                   " incremental searching
set scrolloff=10
set signcolumn=yes
set colorcolumn=80
set relativenumber
set laststatus=2
set title
set autoindent
set colorcolumn=80
set showcmd
set background=dark

set ttyfast                     " terminal acceleration
set smarttab                    " set tab for shifttabs logic
set showmatch                   " shows matching part of bracket pairs (), [], {}
set clipboard=unnamed           " use system clipboard

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugger')

Plug 'gruvbox-community/gruvbox'
"Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' 
Plug 'garbas/vim-snipmate' 
Plug 'MarcWeber/vim-addon-mw-utils'  
Plug 'tomtom/tlib_vim'              
Plug 'honza/vim-snippets'          
Plug 'klen/python-mode'           
Plug 'junegunn/vim-plug'

call plug#end()

colorscheme gruvbox

let mapleader = " "

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

inoremap jk <Esc>

nnoremap <leader>wv :vs<CR>
nnoremap <leader>wh :vs<CR>
nnoremap <leader>wl <Ctrl-w>l
nnoremap <leader>wh <Ctrl-w>h
nnoremap <leader>wj <Ctrl-w>j
nnoremap <leader>wk <Ctrl-w>k
nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :q<CR>

nnoremap <leader><leader> :source /HOME/Dotfiles/.vimrc<CR>


