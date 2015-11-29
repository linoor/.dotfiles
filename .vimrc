" size of a hard tabstop
set tabstop=4

syntax on
colorscheme brogrammer

" remap esc to jj
inoremap jj <ESC>

" size of an "indent"
set shiftwidth=4

" inc search
set incsearch

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" turn of number lines"
set number

" set auto refresh of files (e.g. after git checkout)"
set autoread

" pathogen
execute pathogen#infect()
filetype plugin indent on

" syntactic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

le g:syntactic_Haskell_checkers = ['hlint']
