
scriptencoding utf-8
set encoding=utf-8
set nocompatible       " be iMproved, required
filetype off           " required

" specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug '~/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Raimondi/delimitMate'
Plug 'udalov/kotlin-vim'
Plug 'junegunn/goyo.vim'
Plug 'thinca/vim-fontzoom'

" Initialize plugin system
call plug#end()


filetype plugin indent on    " required

let mapleader = "\<Space>"

" edit vimrc and source on save:
nnoremap <silent> <Leader>v :tabnew<CR>:e ~/.vimrc<CR>
augroup AutoCommands
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" automatically source vimrc on save:
autocmd! bufwritepost .vimrc source %

syntax on         " Turns on syntax highlighting
set termguicolors " full terminal colors
set ruler         " Show row and column ruler information
set showmatch     " set show matching parenthesis
set cursorline    " highlight the cursor line
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set hlsearch      " highlight search terms
set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set nowrap        " don't wrap lines
set number        " always show line numbers
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set shiftwidth=4  " number of spaces to use for autoindenting
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=4     " a tab is four spaces
set nobackup      " don't write backup files
set noswapfile    " don't write swap files
set wildignore=*.swp,*.bak,*.pyc,*.class

" colorscheme
colors two-firewatch
"colors nord
"colors gruvbox
"colors gotham256

" enable mouse
if has('mouse')
    set mouse+=a
endif

" copy
if has('xterm_clipboard')
    set clipboard=unnamedplus
    vmap <leader>y "+y
endif

" NerdTree
map <leader>d :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ripgrep
set grepprg=rg\ --vimgrep

" FZF
nnoremap <Leader>a :Rg <C-R>=expand('<cword>')<CR><CR>
" nnoremap <silent> <Leader>a :Rg <C-R><C-W><CR>
map <leader>b :History<CR>
nnoremap <C-p> :Files<CR>

" paste mode
set pastetoggle=<F3>

" indent line
let g:indentLine_char = '┆' "┆︙
let g:indentLine_color_term = 235
let g:indentLine_noConcealCursor = 1

" full screen mode C-F11
noremap <F35> :Goyo<CR>

" // will search for the current visual selection
vnoremap // y/<C-R>"<CR>"

" escape will clear search highlight
map <Esc> <Esc>:nohlsearch<CR>

