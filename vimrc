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
Bundle 'ervandew/supertab'

Bundle 'godlygeek/tabular'

Bundle 'kien/ctrlp.vim'

Bundle 'bling/vim-airline'
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

Bundle 'mattn/emmet-vim'

Bundle 'Raimondi/delimitMate'

Bundle 'scrooloose/syntastic'

Bundle 'scrooloose/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'
map <leader><Space> <leader>ci

Bundle 'sjl/gundo.vim'

Bundle 'tpope/vim-fugitive'

Bundle 'tpope/vim-rails'

" Color Schemes
" -------------
Bundle 'benjaminwhite/Benokai'

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

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Make arrow keys useful (tab navigation)
noremap <silent> <Up> :tabfirst<CR>
noremap <silent> <Down> :tablast<CR>
noremap <silent> <Left> :tabprev<CR>
noremap <silent> <Right> :tabnext<CR>
 
" Quickly edit and source vimrc
nnoremap <silent> <leader>v :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>V :source $MYVIMRC<cr>

" Quickly edit zshrc
nnoremap <silent> <leader>z :tabedit ~/.zshrc<cr>

" Enable/disable spell check
nnoremap <silent> <leader>s :set spell!<cr>

" Toggles line numbers and relative line numbers
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>r :set relativenumber!<CR>


" ========
" Settings
" ========

" Show line numbers
set number

" Enables line wrapping
set wrap

" Eliminates delay when pressing esc (tmux requires a similar setting)
set ttimeoutlen=50

" Colors the 80th column
set colorcolumn=80

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

" Make insert mode more visible
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Use soft tabs with 4 spaces per tab by default
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

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
