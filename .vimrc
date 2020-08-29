set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
"Plugin 'OrangeT/vim-csharp'
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}
"Plugin 'Shougo/unite.vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'KabbAmine/vCoolor.vim'

" Syntax
Plugin 'pangloss/vim-javascript'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'posva/vim-vue'
Plugin 'evidens/vim-twig'
Plugin 'jparise/vim-graphql'

" Insert mode
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'
"Plugin 'ervandew/supertab'

" Colors
" Using base16 fork due to https://github.com/chriskempson/base16-vim/issues/197
Plugin 'danielwe/base16-vim'

call vundle#end()            " required

filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" Sets how many lines of history VIM has to remember
set history=700

" This shows what you are typing as a command.
set showcmd

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevelstart=20


" Autoindent
set autoindent

" Persistant undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set hidden


" Disable word wrap
set nowrap

" Enable filetype plugins
filetype plugin on
filetype indent on

au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.cshtml set syntax=html

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Highlight current line
set cul

set backspace=indent,eol,start

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.git,node_modules

"Always show current position
set ruler

set number

" Height of the command bar
set cmdheight=1

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells

" Clear highlighting on escape in normal mode
 nnoremap <esc> :noh<return><esc>
 nnoremap <esc>^[ <esc>^[

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

let base16colorspace=256
set termguicolors
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

"colorscheme base16-unikitty-light
colorscheme schonert
set background=dark

if $ITERM_PROFILE != "" && match($ITERM_PROFILE, 'schonert-') == 0
	exe "set background=".substitute($ITERM_PROFILE, 'schonert-', '', '')
endif

let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1

set guioptions-=T
set guioptions+=e
set t_Co=256
"set term=xterm-256color
set guitablabel=%M\ %t
set guifont="SF Mono 14"

" gui colors if running iTerm
if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use spaces instead of tabs
set noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=%

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Use clipboard
"set clipboard=autoselect
set clipboard+=unnamed
"set mouse=a

""""""""""""""""""""""""""""""
" => Performance
""""""""""""""""""""""""""""""
" disable auto matching parens
let g:loaded_matchparen=1

" don't render special chars (tabs, trails, ...)
set nolist

" lazy drawing
set lazyredraw
set ttyfast

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


""""""""""""""""""""""""""""""
" => Plugin setting
""""""""""""""""""""""""""""""
" NerdTree
map <Leader>n :NERDTreeToggle<CR>

" YouCompleteMe
let g:ycm_add_preview_to_completeopt=1

"CTRLp
let g:ctrlp_working_path_mode = 'r'
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>

"" Look in assets folder
nnoremap <leader>a :CtrlP assets<CR>
nnoremap <leader>A :CtrlPBuffer assets<CR>

"" Look in dev folder
nnoremap <leader>d :CtrlP dev<CR>
nnoremap <leader>D :CtrlPBuffer dev<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction
