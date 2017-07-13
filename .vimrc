:imap jk <Esc>

syntax on
syntax enable

set tabstop=3
set shiftwidth=3
set expandtab
set wrap

set number
set relativenumber
set encoding=utf-8

set scrolloff=6
set sidescrolloff=15
set sidescroll=1


" Color scheme (terminal)
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=light

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
Bundle 'dag/vim-fish'
Bundle 'tpope/vim-surround'

Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'easymotion/vim-easymotion'
Bundle 'godlygeek/tabular'

filetype plugin indent on

" Paste last yanked item
noremap <Leader>p "0p
noremap <Leader>P "0P


:set hlsearch
:set ignorecase
:set incsearch
:set smartcase
:nmap \q :nohlsearch<CR>

" for regular expressions magic
set magic

nnoremap Q @q

" open last closed split window
nmap <c-t> :vs<bar>:b#<CR>

" always do global substitutions
set gdefault
" execute q macro over the selected lines
xnoremap Q :'<,'>:normal @q<CR>

" higlights the current line
:set cul

" colors
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

:let mapleader = " "

" add a newline and don't exit the command mode
nmap <S-Enter> O<Esc>

