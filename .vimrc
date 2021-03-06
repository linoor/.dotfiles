" movement
:imap jk <Esc>
nnoremap j gj
nnoremap k gk

syntax on
syntax enable

set tabstop=3
set shiftwidth=3
set expandtab " change tabs to spaces
set wrap
set showcmd

set number
set relativenumber
set encoding=utf-8
set wildmenu " autocomplete in menu
set showmatch " highlighting matches

set scrolloff=6
set sidescrolloff=15
set sidescroll=1

" Color scheme (terminal)
let g:solarized_termcolors=256
set t_Co=256
colorscheme badwolf
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set mouse=a
if !has('nvim')
   set ttymouse=xterm2
endif

" Fish options
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'

Bundle 'easymotion/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'slashmili/alchemist.vim'
Bundle 'dhruvasagar/vim-table-mode'

filetype plugin indent on

" Paste last yanked item
noremap <Leader>p "0p
noremap <Leader>P "0P


:set hlsearch   " highlight when searching
:set ignorecase " ignore case when searching by default
:set incsearch  " search before pressing enter
:set smartcase 
:nmap \q :nohlsearch<CR>

" map Q to repeat last command
nnoremap Q @q

" open last closed split window
nmap <c-t> :vs<bar>:b#<CR>

set gdefault " always do global substitutions

" execute q macro over the selected lines
xnoremap Q :'<,'>:normal @q<CR>

:set cul " higlights the current line

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

:let mapleader = " "
map <Space> <Nop>

" add a newline and don't exit the command mode
nmap <S-Enter> O<Esc>

" refresh file automatically "
:set autoread
