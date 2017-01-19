:imap jk <Esc>
:imap kj <Esc>

syntax on
syntax enable

set tabstop=4
set shiftwidth=4
set expandtab
set wrap

set number
set encoding=utf-8

" Color scheme (terminal)
set background=light
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=256

set mouse=a
set ttymouse=xterm2

" Fish options
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dag/vim-fish'

filetype plugin indent on
