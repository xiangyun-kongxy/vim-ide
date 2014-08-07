" tag list settings
set nocst 
set tags=$PWD/tags 
if filereadable('/usr/local/bin/ctags')
    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
else
    let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
endif
let Tlist_Show_One_File = 1 
let Tlist_Use_Right_Window = 1
let Tlist_Display_Tag_Scope = 0
let Tlist_Sort_Type = 'order'

let ctag_rebuild=Tlist_Ctags_Cmd . ' -R -o ' . root_path . '/tags ' . root_path 
map <C-b> :call system(ctag_rebuild)<cr>
map <C-o> :TlistToggle<cr>
map r :TlistShowTag<cr>
