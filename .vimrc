set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'jpo/vim-railscasts-theme'

" Vim enhancements
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'jceb/vim-hier'
Plugin 'pangloss/vim-javascript'
Plugin 'tikhomirov/vim-glsl'

" Scala
Plugin 'derekwyatt/vim-scala'
"Plugin 'ktvoelker/sbt-vim'

" Clojure
" Plugin 'fwolanski/vim-clojure-conceal' , {'for': 'clojure'}     " Fancy unicode symbols for Clojure
" Plugin 'guns/vim-clojure-highlight'    , {'for': 'clojure'}     " Improved syntax highlighting
" Plugin 'guns/vim-clojure-static'       , {'for': 'clojure'}     " Clojure syntax, basic indentation
" Plugin 'vim-scripts/paredit.vim'       , {'for': 'clojure'}     " Easy parens management

" Plugin 'tpope/vim-leiningen'
" Plugin 'tpope/vim-projectionist'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-fireplace'           , {'for': 'clojure'}     " Evaluate code in a background repl

" Ruby/Rails specific plugins
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-bundler'
" Plugin 'wavded/vim-stylus'

" Latex
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'lervag/vim-latex'

" Python specific plugins
Plugin 'jpalardy/vim-slime'


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
set tabstop=4
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

set colorcolumn=80
set hidden

let mapleader = ","

nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader><leader> <c-^>

"vim-latex specific conf
let g:latex_fold_enabled = 0
"let g:latex_viewer = 'gopen'
"let g:latex_quickfix_autojump = 1

let  g:C_UseTool_cmake = 'yes' 

" Plugin specific {

    " The-NERD-Tree {
        nnoremap <f2> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\~$']
    " }

 " }

" rainbow_parenthesis { 
    au VimEnter * RainbowParenthesesToggle 
    au Syntax * RainbowParenthesesLoadRound 
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }

let g:slime_target = "tmux"
let g:slime_paste_file =  tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_python_ipython = 1

" latex plugin conf

let g:tex_fast= ""
let g:tex_no_error=1
