set nocompatible " vim, not vi
filetype off
set noswapfile
set ruler

" pathogen setup
execute pathogen#infect()
execute pathogen#helptags()

"syntax highlighting, line numbering, fixes
syntax on
set nu
filetype plugin indent on     " required!

" leader
:let mapleader = ","

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" js
let g:used_javascript_libs = 'jquery,requirejs,angularjs,angularui,underscore,jasmine,backbone'

" search
set hlsearch

" jk to ESC
:imap jk <Esc>

" set underline for spelling mistakes instead of full word highlight
hi clear SpellBad
hi SpellBad cterm=underline

colorscheme gruvbox

" set ambiwidth=double
set noshowmode
set laststatus=2
let g:airline_theme='luna'
let g:bufferline_echo = 0
set ttimeoutlen=50
set incsearch

" fix airline width
set tabstop=2 shiftwidth=2 expandtab
" set ttyfast
set lazyredraw

" draw spaces as .s
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

" nerdtree shortcut
cmap ntt NERDTreeTabsToggle

" show hidden files in NerdTree
let NERDTreeShowHidden=1

" show file path
cmap fp execute "echo expand('%:p')"

" Set with at 80, add column indicator at 81
set textwidth=80 colorcolumn=+1

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
" disable markdown folding
let g:vim_markdown_folding_disabled=1

" Enable spellchecking for Markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Rust indentation to 4 spaces
autocmd BufRead,BufNewFile *.rs setlocal expandtab
autocmd BufRead,BufNewFile *.rs setlocal tabstop=4
autocmd BufRead,BufNewFile *.rs setlocal shiftwidth=4
autocmd BufRead,BufNewFile *.rs setlocal autoindent
autocmd BufRead,BufNewFile *.rs setlocal smartindent
autocmd BufRead,BufNewFile *.rs setlocal textwidth=100

" OCaml
au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" Erlang
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab tabstop=4 shiftwidth=4 textwidth=100
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang
autocmd BufRead,BufNewFile Emakefile set expandtab tabstop=4 shiftwidth=4 textwidth=100

" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab

" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab

" for .clj and .boot files
au BufNewFile,BufRead *.clj,*.boot set filetype=clojure expandtab

" for .sc (ammonite scala)
au BufNewFile,BufRead *.sc set filetype=scala expandtab
