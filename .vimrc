" Ben White

" ------------------------------------------------------------------------------
" VUNDLE
" ------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" Initial Vundle Setup, courtesy of Erik Zaadi

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugins:

Bundle 'gmarik/vundle'
"Bundle 'coot/atp_vim'
"Bundle 'ehamberg/vim-cute-python'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
"Bundle 'klen/python-mode'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
"Bundle 'mattn/gist-vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'sjl/vitality.vim'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-characterize'
"Bundle 'vim-scripts/RelOps'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-notes'
"Bundle 'xuhdev/vim-latex-live-preview'

" Color Schemes: 

Bundle 'benjaminwhite/Benokai'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'stephenmckinney/vim-solarized-powerline'
"Bundle 'pearofducks/solarized-powerlines'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on                   " required!

" ------------------------------------------------------------------------------
" Plugin Specific
" ------------------------------------------------------------------------------
" make compile nice
autocmd FileType tex :nmap <Leader>ll \ll
nnoremap <Leader>ss :LatexmkStop<CR>
"let g:LatexBox_latexmk_options = '-pvc'
let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_latexmk_async=1
" vim-latex-live-preview
"autocmd Filetype tex setl updatetime=1
"nmap <F12> :LLPStartPreview<cr>
" ========= EasyTags ==========
let g:easytags_updatetime_warn = 0

" ========= Gundo ==========
nnoremap <silent> <leader>u :GundoToggle<CR>

" ========= Expand-Region ==========
vmap v <Plug>(expand_region_expand)

" ========= Airline ==========
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_section_z=''
" ========= nerdtree ==========
nnoremap <C-t> :NERDTreeToggle<CR>

" ========= pymode ==========
let g:pymode_lint=0
" ========= vim-notes ==========
"let g:notes_directories = ['~/Documents/Notes']

" ========= YouCompleteMe ==========
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_autoclose_preview_window_after_completion = 1
" ------------------------------------------------------------------------------
" General
" ------------------------------------------------------------------------------

"autocmd BufWriteCmd *.tex :!rubber --pdf % && rubber --clean % 
"&& open hw2-3.pdf && open -a iTerm

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ========= Split like every other program ==========

set splitbelow
set splitright

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

"let g:vitality_always_assume_iterm = 1

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Always show line numbers, but only in current window.
"autocmd WinEnter * :setlocal number
"autocmd WinLeave * :setlocal nonumber

" Enable mouse
if has("mouse")
    set mouse=a
endif

" Set the number of available colors for terminals
set t_Co=256

" Enable syntax highlighting
syntax enable

" Set dark background
set background=dark

" -----------
" Solarized 
" -----------
"colorscheme solarized
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
" let g:Powerline_colorscheme='solarized16_dark'
"let g:Powerline_colorscheme='solarizedDarkLC'
colorscheme Benokai
"let g:molokai_original = 1
"colorscheme molokai

" Allow backspace in all situations
set backspace=indent,eol,start

" Fold Method
"set foldmethod=indent

" Save more history and undo levels
set history=1000 undolevels=1000

" Do not use backups when editing files in temporary directories
"set backupskip=/tmp/*,/private/tmp/*

" Time out immediately on key codes
set ttimeout ttimeoutlen=0

" Use the * register for the X clipboard
"if has('clipboard')
    "set clipboard=unnamed
"endif
set clipboard=unnamed

" Complete to the longest common substring and list suggestions, then iterate
set wildmode=longest:list,full

nnoremap <leader>i :set list!<cr>
" select all
map <Leader>a ggVG
" Lower the priorities of PDF and compiled files in wildcard matching
"set suffixes+=.class,.out,.pdf,.pyc

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
"augroup line_return
        "au!
            "au BufReadPost *
                    "\ if line("'\") > 0 && line("'\") <= line("$") |
                    "\     execute 'normal! g`"zvzz' |
                    "\ endif
        "augroup END"'")

" Wildmenu stuff
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files"

" Increment and decrement alphabetical characters, but not octal numbers
set nrformats+=alpha nrformats-=octal

" Increment and decrement with + and -
"nnoremap + <C-a>
"nnoremap - <C-x>
"noremap <silent> <C--> :tabprev<CR>
"noremap <silent> <C-=> :tabnext<CR>
" Indent
" inoremap <C-Return> <CR><CR><C-o>k<Tab>
" Copy to the end of the line with Y
nnoremap Y y$

" inoremap <C-CR> <CR><esc>O
" Prefer jumping directly to marks instead of to their lines
"nnoremap ' `
"nnoremap ` '


" Swap colon with semicolon for easier access to command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Use comma as leader
"let mapleader = ','

" Folding
nnoremap , za
au BufRead * normal zR

let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap <silent> <leader>v :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>V :source $MYVIMRC<cr>
nnoremap <silent> <leader>z :tabedit ~/.zshrc<cr>
nnoremap <silent> <leader>s :set spell!<cr>



" Insert blank lines without going into insert mode
nnoremap go o<esc>k
nnoremap gO O<esc>j

" Navigate buffers and tabs via leader
"nnoremap <Leader>j :bn<CR>
"nnoremap <Leader>k :bp<CR>
"nnoremap <Leader>l :tabn<CR>
"nnoremap <Leader>h :tabp<CR>
"if bufwinnr(1)
    "nnoremap + <C-W>+
    "nnoremap - <C-W>-
"endif
" Navigate splits more easily

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Make arrow keys useful
noremap <silent> <Up> :tabfirst<CR>
noremap <silent> <Down> :tablast<CR>
noremap <silent> <Left> :tabprev<CR>
noremap <silent> <Right> :tabnext<CR>


" ------------------------------------------------------------------------------
" Format
" ------------------------------------------------------------------------------

" Stops newlines from automatically being made into a comment
autocmd FileType * setlocal formatoptions-=ro


" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
"noremap H ^
"noremap L $

"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Wrap
set wrap

" Show line numbers
set number

" Highlight 80th column
set cc=80

" Toggles line numbers and relative line numbers
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>r :set relativenumber!<CR>

" Show partial commands
set showcmd

" Show at least 2 lines of context above and below the cursor when possible
set scrolloff=2

" Show parts of wrapped lines that are cut off at the bottom
set display=lastline

" Do not display the intro message; shorten all file messages
set shortmess+=Ia

" Match pairs of angle brackets in HTML, XML, and Markdown
autocmd FileType html,htmldjango,xml,markdown set matchpairs+=<:>

" Toggles paste mode
set pastetoggle=<F2>

" Automatically leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------

" Sets the number of spaces per tab in the current buffer only
function! Indentation(...)
    " Use the given width if it is positive, otherwise default to 4
    let l:width = (a:0 > 0 && a:1 > 0) ? a:1 : 4

    " Display tab characters as l:width spaces wide; also affects retab
    let &l:tabstop = l:width

    " Count tabs as l:width spaces wide for editing operations
    let &l:softtabstop = l:width

    " Count tabs as l:width spaces wide when shifting and for autoindent
    let &l:shiftwidth = l:width
endfunction

" Sets the given number of spaces per tab without changing the tab type
command! -nargs=? Indentation call Indentation(<f-args>)
command! -nargs=? I Indentation <args>

" Sets soft tabs with the given number of spaces per tab
command! -nargs=? Spaces call Indentation(<f-args>) | setlocal expandtab
command! -nargs=? S Spaces <args>

" Sets hard tabs with the given number of spaces per tab
command! -nargs=? Tabs call Indentation(<f-args>) | setlocal noexpandtab
command! -nargs=? T Tabs <args>

" Use soft tabs with 4 spaces per tab by default
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Round to the nearest tab when shifting
set shiftround

" Copy the indentation of the current line exactly for new lines
set autoindent smartindent

" Use soft tabs with 2 spaces per tab for CSS, HTML, XML, and JavaScript
autocmd FileType css,html,htmldjango,xml,javascript Spaces 2

" Use hard tabs with 4 spaces per tab for certain configuration files
autocmd FileType make,gitconfig,sshconfig Tabs 4

" Remain in visual mode after shifting or re-indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" ------------------------------------------------------------------------------
" Status line
" ------------------------------------------------------------------------------

"" Always show the status line
set laststatus=2

"" File name, modified, read-only, help, preview, and file type, if any
"set statusline=%f%m%r%h%w\ %y%{&ft!=''?'\ ':''}

"" File format and file encoding, or encoding if no file encoding
"set statusline+=[%{&ff},%{&fenc!=''?&fenc:&enc}]

"" Switch to right alignment here; cut off parts of what follows if necessary
"set statusline+=%=%<

"" Character under cursor in ASCII and in hexadecimal
"set statusline+=[\%03b,0x\%02B]

"" Line/lines and column, including virtual column if applicable
"set statusline+=\ [%l/%L,%c%V]

"" Percent of file in terms of current line and section of file shown
"set statusline+=\ [%p%%,%P]

" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------

" Search as queries are typed
set incsearch

" Ignore case when searching, but override for capitalized queries
set ignorecase smartcase

 "Highlight search matches
set hlsearch

" Temporarily disables search highlighting
nnoremap <Leader>/ :nohlsearch<CR>

" Clears the previous regular expression
nnoremap <Leader>? :let @/ = ''<CR>

" Matches all characters past column 80
nnoremap <Leader>c /\%>80v.\+<CR>

" Matches all trailing whitespace
nnoremap <Leader>w /\s\+$<CR>

" Removes all trailing whitespace
nnoremap <Leader>W :%s/\s\+$//g<CR>

" Edit files in same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map <leader><Space> <leader>ci

" Show syntax highlighting groups for word under cursor
"nmap <leader>b :call <SID>SynStack()<CR>
"function! <SID>SynStack()
    "if !exists("*synstack")
        "return
    "endif
    "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

cmap w!! %!sudo tee > /dev/null %
" ----------------------------------
" Abbreviations
" ----------------------------------
iabbrev @@ ben.whit@berkeley.edu
iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ
