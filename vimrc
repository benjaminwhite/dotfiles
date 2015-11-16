" Vim Run Commands
"
" Author: Ben White
" URL: benwhite.io

" Enter is a better leader key than \
let mapleader = "\<Enter>"
let maplocalleader = "\\"

" ====== "
" VUNDLE "
" ====== "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
" -------
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_escape_grep = 1

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

Plugin 'godlygeek/tabular'

Plugin 'benjaminwhite/vim-numbertoggle'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'pangloss/vim-javascript'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

Plugin 'Raimondi/delimitMate'

Plugin 'rking/ag.vim'

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

Plugin 'scrooloose/nerdtree'
noremap <leader>f :NERDTreeToggle<CR>

if has("lua")
  Plugin 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
else
  Plugin 'ervandew/supertab'
endif

Plugin 'sjl/gundo.vim'
let g:gundo_preview_bottom = 1
noremap <silent> <leader>u :GundoToggle<CR>

Plugin 'sjl/vitality.vim'

Plugin 'szw/vim-ctrlspace'
noremap <silent> <C-h> :tabprev<CR>
noremap <silent> <C-j> :CtrlSpaceGoDown<CR>
noremap <silent> <C-k> :CtrlSpaceGoUp<CR>
noremap <silent> <C-l> :tabnext<CR>
noremap <silent> <C-p> :CtrlSpace O<CR>
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

Plugin 'tomtom/tcomment_vim'
noremap <silent> <Space> :TComment<CR>

Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-rails'

Plugin 'tpope/vim-repeat'

Plugin 'Valloric/MatchTagAlways'
let g:mta_filetypes = {'html': 1, 'xhtml': 1, 'xml': 1, 'jinja': 1, 'eruby': 1}

" Color Schemes
" -------------
Plugin 'benjaminwhite/Benokai'

call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax enable

" Best colorscheme ever
colorscheme Benokai

" ======== "
" MAPPINGS "
" ======== "

" I use : far too much to press shift all the time
nnoremap ; :
vnoremap ; :

" Make Y behave like D
nnoremap Y y$

" Make a new line without entering insert mode
nnoremap go o<esc>k
nnoremap gO O<esc>j

" Arrow Keys scroll (useful and friendly to those unfamiliar with vim)
nnoremap <Left> zh
nnoremap <Down> <C-e>
nnoremap <Up> <C-y>
nnoremap <Right> zl

" Append above line to current line
nnoremap K kddpkJ

" Indentation shifting
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Quickly edit and source vimrc
nnoremap <silent> <leader>v :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>V :source $MYVIMRC<cr>

" Quickly edit zshrc
nnoremap <silent> <leader>z :tabedit ~/.zshrc<cr>

" Quickly edit tmux
nnoremap <silent> <leader>t :tabedit ~/.tmux.conf<cr>

" Enable/disable spell check
nnoremap <silent> <leader>s :set spell!<cr>

" ======== "
" Settings "
" ======== "

" Hide buffers instead of closing them
set hidden

" Show line numbers
set number

" Enables line wrapping
set wrap

" Vastly improved ex mode tab completion
set wildmenu

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
