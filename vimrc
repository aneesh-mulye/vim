" Installed plugins:
" Vundle
" YouCompleteMe
" vim-cute-python
"
" Vundle configuration
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ehamberg/vim-cute-python'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
" Rust syntax highlighting
Plugin 'rust-lang/rust.vim'
" Automatically close/insert brackets, parens, and quotes.
Plugin 'jiangmiao/auto-pairs'
Plugin 'hdima/python-syntax'
Plugin 'wlangstroth/vim-racket'
Plugin 'vim-syntastic/syntastic'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
" Colour scheme(s)
Plugin 'jnurmine/Zenburn'
" End Vundle configuration
call vundle#end()
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

syntax on

" Enable full syntax highlighting for python (an option in python-syntax)
let python_highlight_all=1

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" So that colour schemes work correctly in both bash and tmux.
set t_Co=256
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
  set t_ut=
endif
" Set the colour scheme
colorscheme zenburn

" highlight beyond 80 columns
if exists('+columncolor')
  set columncolor=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Disable ycm_extra_conf confirmation question
let g:ycm_confirm_extra_conf = 0


" line number settings
set number
set relativenumber

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" soft wrapping
set wrap
set linebreak

" YCM FixIt keybinding
nnoremap <F9> :YcmCompleter FixIt<CR>

" Enable rainbow parentheses
let g:rainbow_active = 1

" Airline buffer line
let g:airline#extensions#tabline#enabled = 1

" Modified bash-like completion
set wildmode=longest,list,full
set wildmenu
