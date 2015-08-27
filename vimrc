" Vim Run Commands
"
" Author: Ben White
" URL: benwhite.io
"

" Space is a better leader key than \
let mapleader = "\<Space>"
let maplocalleader = "\\"

" ======
" VUNDLE
" ======

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
" -------
Plugin 'bling/vim-airline'
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Esc>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Esc>j :TmuxNavigateDown<cr>
nnoremap <silent> <Esc>k :TmuxNavigateUp<cr>
nnoremap <silent> <Esc>l :TmuxNavigateRight<cr>
nnoremap <silent> <Esc>\ :TmuxNavigatePrevious<cr>

Plugin 'ervandew/supertab'

Plugin 'godlygeek/tabular'

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'kien/ctrlp.vim'

Plugin 'mattn/emmet-vim'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>

Plugin 'scrooloose/nerdcommenter'
map <leader><Space> <leader>ci

Plugin 'sjl/gundo.vim'

Plugin 'sjl/vitality.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-rails'

" Color Schemes
" -------------
Plugin 'benjaminwhite/Benokai'

call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax enable

" Best colorscheme ever
colorscheme Benokai

" ========
" MAPPINGS
" ========

" I use : far too much to press shift all the time
nnoremap ; :
vnoremap ; :

" Navigate wrapped lines like any other line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Make Y behave like D
nnoremap Y y$

" Make a new line without entering insert mode
nnoremap go o<esc>k
nnoremap gO o<esc>j

" Keep highlight when shifting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep previous location in the middle of the window
nnoremap <c-o> <c-o>zz

" Make arrow keys useful (split resizing)
nnoremap <silent> <Up> :resize -5<cr>
nnoremap <silent> <Down> :resize +5<cr>
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>

" Tab Navigation
nnoremap <silent> H :tabprev<CR>
nnoremap <silent> L :tabnext<CR>

" Make K behave like J
nnoremap K kddpkJ

" Quickly edit and source vimrc
nnoremap <silent> <leader>v :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>V :source $MYVIMRC<cr>

" Quickly edit zshrc
nnoremap <silent> <leader>z :tabedit ~/.zshrc<cr>

" Quickly edit tmux
nnoremap <silent> <leader>t :tabedit ~/.tmux.conf<cr>

" Enable/disable spell check
nnoremap <silent> <leader>s :set spell!<cr>

" ========
" Settings
" ========

" Show line numbers
set number

" Enables line wrapping
set wrap

" Toggle paste mode with F2
set pastetoggle=<F2>

" Eliminates delay when pressing esc (tmux requires a similar setting)
set ttimeoutlen=50

" Colors the 80th column
set colorcolumn=80

" Increase tab limit
set tabpagemax=100

" Split like every other program
set splitbelow
set splitright

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Save more history and undo levels
set history=1000 undolevels=1000

" Allow backspace in all situations
set backspace=indent,eol,start

" Use soft tabs with 2 spaces per tab by default
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Search as queries are typed
set incsearch

" Ignore case when searching, but override for capitalized queries
set ignorecase smartcase

 "Highlight search matches
set hlsearch

" Enable mouse
if has("mouse")
    set mouse=a
endif
