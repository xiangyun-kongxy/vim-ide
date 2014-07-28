"nerd tree settings
if !filereadable(expand('%:p:f'))
    autocmd VimEnter * NERDTree
endif

map <c-f> :NERDTree<cr>
map <c-g> :NERDTreeClose<cr>
map cb :Bookmark

