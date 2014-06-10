set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Vim enhancements
Plugin 'tpope/vim-fugitive'
"Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
"Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'

" Ruby/Rails specific plugins
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-bundler'

" Latex
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

call vundle#end()
filetype plugin indent on

" begin Plugin specific conf

" latex-suite specific options
"let g:tex_flavor='latex'

autocmd FileType ruby set sw=2 sts=2 et
"autocmd FileType javascript set sw=4 sts=4 et
au! BufRead,BufNewFile *.sass         setfiletype sass 

" end Plugin specific conf

"if &term =~ "xterm" || &term =~ "screen"
"    map <Esc>OP <F1>
"    map <Esc>OQ <F2>
"    map <Esc>OR <F3>
"    map <Esc>OS <F4>
"    map <Esc>[16~ <F5>
"    map <Esc>[17~ <F6>
"    map <Esc>[18~ <F7>
"    map <Esc>[19~ <F8>
"    map <Esc>[20~ <F9>
"    map <Esc>[21~ <F10>
"    map <Esc>[23~ <F11>
"    map <Esc>[24~ <F12>
"endif

" Reload a file if it has been changed quite useful when switching between
" branches with Git.
set autoread
"set wildignore=*.o,*.obj
set noswapfile
set t_Co=256

"colorscheme jellybeans
colorscheme railscasts

set shell=/bin/bash

set nowrap
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set number
set ruler
set cursorline

"" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set gdefault " have :s///g flag by default on

set notimeout
set ttimeout
set ttimeoutlen=100

nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader><leader> <c-^>

let mapleader = ","

"nnoremap <f2> :NERDTreeToggle<cr>
"let NERDTreeIgnore=['\~$']
