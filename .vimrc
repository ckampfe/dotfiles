set nocompatible " vim, not vi
filetype off
set noswapfile
set ruler

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" pathogen setup
execute pathogen#infect()

"syntax highlighting, line numbering, fixes
syntax on
set nu
filetype plugin indent on     " required!

" dem bundles
Bundle 'gmarik/vundle'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
" Bundle 'myusuf3/numbers.vim'
Bundle 'jelera/vim-javascript-syntax'

" search
set hlsearch

" colorscheme github
color bvemu


" set ambiwidth=double
set noshowmode
set laststatus=2
let g:airline_theme='luna'
let g:bufferline_echo = 0
set ttimeoutlen=50

" fix airline width
set tabstop=2 shiftwidth=2 expandtab
" set ttyfast
set lazyredraw

set list
set listchars=tab:>-,trail:.

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" splits
set splitbelow
set splitright

cmap ntt NERDTreeToggle

" Set with at 80, add column indicator at 81
set textwidth=80 colorcolumn=+1

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>
