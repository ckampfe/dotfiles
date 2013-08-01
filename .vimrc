set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"syntax highlighting and line numbering
syntax on
set nu

" set ambiwidth=double
set noshowmode
set laststatus=2
let g:airline_theme='luna'
let g:bufferline_echo = 0
set ttimeoutlen=20


" dem bundles
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle "myusuf3/numbers.vim"

" fix airline width
set tabstop=2 shiftwidth=2 expandtab
filetype plugin indent on     " required!
