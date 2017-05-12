:imap jk <Esc>

syntax on
syntax enable

set tabstop=4
set shiftwidth=4
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

filetype plugin indent on

" Paste last yanked item
noremap <Leader>p "0p
noremap <Leader>P "0P

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

nnoremap Q @q
