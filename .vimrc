:imap jk <Esc>

syntax on
syntax enable

set tabstop=2
set shiftwidth=2
set expandtab
set wrap

set number
set relativenumber
set encoding=utf-8

" Color scheme (terminal)
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=light

set mouse=a
set ttymouse=xterm2

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

filetype plugin indent on

" Paste last yanked item
noremap <Leader>p "0p
noremap <Leader>P "0P

:set hlsearch
:set ignorecase
:set incsearch
:set smartcase
:nmap \q :nohlsearch<CR>

nnoremap Q @q

" open last closed split window
nmap <c-t> :vs<bar>:b#<CR>

" always do global substitutions
set gdefault
" execute q macro over the selected lines
xnoremap Q :'<,'>:normal @q<CR>

" higlights the current line
:set cul
