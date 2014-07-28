" indent setting
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set nowrap
set backspace=start,indent,eol

hi TooLongLine ctermbg=white ctermfg=red
match TooLongLine '\%>81v.*'
