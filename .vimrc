set nocompatible
filetype off

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" pathogen setup
execute pathogen#infect()

"syntax highlighting, line numbering, fixes
syntax on
set nu
filetype plugin indent on     " required!


" set ambiwidth=double
set noshowmode
set laststatus=2
let g:airline_theme='luna'
let g:bufferline_echo = 0
set ttimeoutlen=50


" dem bundles
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle "myusuf3/numbers.vim"

" fix airline width
set tabstop=2 shiftwidth=2 expandtab
