set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
Plugin 'VundleVim/Vundle.vim'

" color schema
Plugin 'Solarized'

" file manage
Plugin 'https://github.com/scrooloose/nerdtree.git'

" symbol list, used with ctags
Plugin 'Tagbar'

Plugin 'Syntastic'

" unlimited undo or redo
Plugin 'Gundo' 

Plugin 'mru.vim'

Plugin 'https://github.com/vim-scripts/a.vim.git'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'

Plugin 'vim-cpp-enhanced-highlight'

call vundle#end()
filetype plugin indent on
syntax on

"global settings
autocmd FileType cpp  match TOOLONG /\%>79v.*/
hi TOOLONG term=reverse cterm=reverse ctermbg=15

hi Directory ctermfg=4
hi Comment ctermfg=2
hi Statement ctermfg=3
hi Keyword ctermfg=3
hi Function ctermfg=4 cterm=underline
hi cppSTLfunction ctermfg=4 cterm=bold
hi Type ctermfg=6 cterm=bold
hi cppSTLtype ctermfg=6

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

hi def link cCustomFunc  Function
hi def link cCustomClass  cppType

syn match   myParen1        "<" contains=cParen contains=cCppParen
syn match   myParen1b       ">" contains=cParen contains=cCppParen
syn match   myRawClass      "<\s*\w\+\s*>" contains=myParen1,myParen1b
syn match   myTclass1       "\w\+\s*<\s*\w\+\s*>" contains=myParen1,myParen1b,myRawClass
syn match   myTclass2       "\w\+\s*<\s*\w\+\s*<\s*\w\+\s*>\s*>" contains=myParen1,myParen1b,myRawClass1
syn match   myTclass3       "\w\+\s*<\s*\w\+\s*<\s*\w\+\s*<\s*\w\+\s*>\s*>\s*>" contains=myParen1,myParen1b,myRawClass2
syn match   myTclass4       "\w\+\s*<\w\+\s*<\s*\w\+\s*<\s*\w\+\s*<\s*\w\+\s*>\s*>\s*>\s*>" contains=myParen1,myParen1b,myRawClass3

hi def link myRawClass  cppType
hi def link myTclass1    myRawClass
hi def link myTclass2    myRawClass
hi def link myTclass3    myRawClass
hi def link myTclass4    myRawClass

syntax keyword cppKeyword namespace
syntax keyword cppKeyword class
syntax keyword cppKeyword struct
syntax keyword cppKeyword enum
syntax keyword cppKeyword union
syntax keyword cppKeyword void
syntax keyword cppKeyword char
syntax keyword cppKeyword short
syntax keyword cppKeyword int
syntax keyword cppKeyword long
syntax keyword cppKeyword unsigned
syntax keyword cppKeyword sizeof
syntax keyword cppKeyword typeid
syntax keyword cppKeyword virtual
syntax keyword cppKeyword public
syntax keyword cppKeyword private
syntax keyword cppKeyword protected
syntax keyword cppKeyword template
syntax keyword cppKeyword this
syntax keyword cppKeyword const
syntax keyword cppKeyword static
syntax keyword cppKeyword return

syntax keyword cppKeyword object
syntax keyword cppKeyword ptr
syntax keyword cppKeyword reference

hi def link cppKeyword Keyword


set encoding=utf-8
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
set relativenumber
set hlsearch
set ignorecase

let mapleader=","

set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set nowrap
set backspace=start,indent,eol

set path+=$PWD/**
let root_path=$PWD
autocmd BufEnter * silent! lcd %:p:h

autocmd BufLeave * set nospell
autocmd BufEnter *.md,*.txt set spell

" window switch setting
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
inoremap <c-h> <c-w>h
inoremap <c-j> <c-w>j
inoremap <c-k> <c-w>k
inoremap <c-l> <c-w>l
vnoremap <c-h> <c-w>h
vnoremap <c-j> <c-w>j
vnoremap <c-k> <c-w>k
vnoremap <c-l> <c-w>l

" nerdtree
map sf :NERDTreeToggle<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=48
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeIgnore=['^.git$']

" mru setting
let MRU_Max_Entries=1024
let MRU_Window_Height=8
let MRU_Auto_Close=0

map sr :MRU<cr>

" Tell vim to remember certain things when we exit
" '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" color
let g:solarized_style = "dark"

let g:ctrlp_by_filename = 1

nmap so :TagbarToggle<CR>
let g:tagbar_ctags_bin = "/opt/local/bin/ctags"
let g:tagbar_width = 64

" syntastic setting
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_include_dirs = [ root_path,'.' ]
let g:syntastic_cpp_compiler_options = '--std=c++11'
let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_cpp_checkers = ['gcc']

let g:syntastic_python_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_python_checkers = ['python']

map <c-c> :SyntasticCheck <cr>
map se :Errors<cr>

autocmd BufWritePost *.h,*.c,*.cpp,*.hpp,*.cc SyntasticCheck

" gundo
let g:gundo_width = 32
let g:gundo_preview_height = 16
let g:gundo_right = 1

" change between header and source
map gh :A<CR>

" status line setting
set statusline=%P\ of\ %L\ [%l:%c#%n]\ %o\ %=[%B:%b]\ [%{FileEncoding()}\|%{FileFormat()}]\ %F%y

function! FileEncoding()
    let encoding=&fileencoding
    return encoding
endfunction

function! FileFormat()
    let format=&fileformat
    return format
endfunction

if !filereadable(expand('%:p:f'))
    autocmd VimEnter * MRU
    autocmd VimEnter * NERDTree
    autocmd VimEnter * TagbarToggle
endif

let local_ycm_conf=root_path . '/.ycm_extra_conf.py'
if filereadable(local_ycm_conf)
    let g:ycm_global_ycm_extra_conf = local_ycm_conf
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
endif
set completeopt=longest,menu
let g:ycm_semantic_triggers = {'cpp': [ 're!.' ], 'c': [ 're!.' ]}
let g:ycm_max_num_candidates = 16
let g:ycm_key_list_select_completion = ['<Enter>']

map sd :YcmCompleter GoToDefinitionElseDeclaration<CR>

