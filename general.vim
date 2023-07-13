set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set autoindent
set smartindent
set smarttab
set nofoldenable
set foldmethod=syntax

"Ignore capital letters during search"
set ignorecase

"This allows for searching capital letters specifically"
set smartcase

"While searching through a file incrementally highlight matching char"
set incsearch

"Set space chars instead of tabs"
set expandtab

"Set shift width to 4 spaces"
set shiftwidth=4

"Do not let cursor to scroll below or above N lines"
set scrolloff=10

"Set tab width to 4 columns"
set tabstop=4
set clipboard=unnamed

set ruler
set showtabline=2
 
set undolevels=500
set backspace=indent,eol,start

" Disable compatibilty with vi"
set nocompatible

" Enable type file detection"
filetype on

"Enable plugins and load plugin for the detected file type"
filetype plugin on

"Load an indent file for the detected file type"
filetype indent on

"Syntax highlight"
syntax on

"Show partial command you type in the last line of the screen"
set showcmd

"Show mode"
set showmode

"Show matching words during search"
set showmatch

"Highlight when search"
set hlsearch

"set cursorline
"set cursorcolumn
set termguicolors

nnoremap zz :update<cr>
nnoremap qq :q!
nnoremap <CR> :noh<CR><CR>

map <C-Right> :bnext<CR>
map <C-l> :bnext<CR>
map <C-Left> :bprev<CR>
map <C-h> :bprev<CR>
map <C-E> :E<CR>
map <C-a> :set filetype=asm<CR>

"Basic autocomp w/o TAB-scroll"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

"jkl; for the win!"
"noremap ; l
"noremap l k
"noremap k j
"noremap j h
nnoremap <S-j> {
nnoremap <S-k> }

nnoremap <S-Up> {
nnoremap <S-Down> }

nnoremap <S-h> ^
nnoremap <S-l> $

inoremap <C-d> <Esc>
vnoremap <C-d> <Esc>
              
noremap ,q <esc>
vnoremap ,q <esc>
let g:coc_global_extensions = ['coc-solargraph']
