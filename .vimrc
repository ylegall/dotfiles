
scriptencoding utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle:
Plugin 'gmarik/Vundle.vim'

"Plugins:
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/ScrollColors'
Plugin 'Raimondi/delimitMate'
Plugin 'itchyny/lightline.vim'
"Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/CSApprox'

call vundle#end()
filetype plugin indent on    " required

let mapleader = "\<Space>"

if has("gui_running")
    set guifont=Ubuntu\ Mono\ 12
    set guioptions-=T
endif

" colorschemes:
set background=dark
colors nord
"colors iceberg
"colors zenburn
"let g:solarized_termcolors=256
"colors tomorrow-night
"colors sierra
"colors gotham256
"colors jellybeans
set background=dark


set t_Co=256
set showmatch     " set show matching parenthesis
set cursorline    " highlight the cursor line
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set hlsearch      " highlight search terms
set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set nowrap        " don't wrap lines
set number        " always show line numbers

set shiftwidth=4  " number of spaces to use for autoindenting
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=4     " a tab is four spaces

set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
"set backspace=indent,eol,start   " allow backspacing over everything in insert mode
"set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"set textwidth=65  "set the textwidth

" enable mouse
if has('mouse')
    set mouse+=a
endif

" copy
if has('xterm_clipboard')
    set clipboard=unnamedplus
    vmap <leader>y "+y
endif

" show trailing whitespace
set list
set listchars=trail:·,precedes:«,extends:»,tab:▸\ 

" nerdcommenter toggle line comment:
nmap cc <leader>c<Space>

" remove trailing whitespace for certain files
"autocmd FileType c,cpp,d,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" highlight parens
"autocmd BufRead,BufNewFile * syn match parens /[(){}u5]/ | hi parens ctermfg=167
"autocmd BufRead,BufNewFile * syn match parens /[(){}]/

" syntastic:
let g:syntastic_d_checkers = ['dmd']

" indent line
let g:indentLine_char = '┆' "┆︙
let g:indentLine_color_term = 235
let g:indentLine_noConcealCursor = 1

map OA <Up>
map OB <Down>
map OD <Left>
map OC <Right>

" for fixing vim arrow keys with tmux:
map <Esc>[B <Down>

" moving lines up and down with Alt:
nnoremap <A-Down> :m+<CR>==
nnoremap <A-Up> :m-2<CR>==
inoremap <A-Down> <Esc>:m+<CR>==gi
inoremap <A-Up> <Esc>:m-2<CR>==gi
vnoremap <A-Down> :m'>+<CR>gv=gv
vnoremap <A-Up> :m-2<CR>gv=gv

" increase indent
nnoremap <A-Right> >>
vnoremap <A-Right> ><CR>gv
inoremap <A-Right> <Esc>>>gi

" decrease indent
nnoremap <A-Left> <<
vnoremap <A-Left> <<CR>gv
inoremap <A-Left> <Esc><<gi

" clear the highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>
map <Esc> <Esc>:nohlsearch<CR>

" delete line(s)
noremap <C-E> dd
inoremap <C-E> <Esc>ddi

" Tab navigation with pageUp/pageDown
map [5;5~ :tabp<CR>
map [6;5~ :tabn<CR>

" paste mode
set pastetoggle=<F3>

" for tmux
set ttymouse=xterm

" fix esc timeout with tmux
"set timeoutlen=1000 ttimeoutlen=10

"  move text and rehighlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" edit vimrc
nnoremap <silent> <Leader>v :tabnew<CR>:e ~/.vimrc<CR>

" ControlP
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_cmd = 'CtrlP'
map <leader>b :CtrlPMRU<CR>
let g:ctrlp_match_window = 'max:20,results:20'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.git
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"Ack
"cnoreabbrev Ack Ack!
noremap <Leader>a :Ack <cword><cr>
"nnoremap <Leader>a :Ack -i <Space>

" NerdTree
map <leader>d :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" override settings:
set shiftwidth=4  " number of spaces to use for autoindenting
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=4     " a tab is four spaces
set et            " insert spaces instead of tabs"
set expandtab

" // will search for the current visual selection
vnoremap // y/<C-R>"<CR>"

" automatically source vimrc on save:
autocmd! bufwritepost .vimrc source %

" lightline
set laststatus=2

syntax on

