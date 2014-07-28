"global settings
set fileencodings=ucs-bom,utf-8,cp936
set helplang=en
set nocompatible
set nobackup
set noswapfile
set nowb
set noerrorbells
set novisualbell
set ruler
set number
set hlsearch

filetype plugin on
filetype indent on
syntax on

let mapleader=","
map r :redo<cr>

hi Pmenu ctermbg=32 ctermfg=150 cterm=bold
hi PmenuSel ctermbg=24 ctermfg=220 cterm=bold
hi Search ctermbg=22 ctermfg=255
