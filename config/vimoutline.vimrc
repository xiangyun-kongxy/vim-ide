" vim outline setting
if has("eval")
  let cpo_save=&cpo
endif
set cpo=B

set smartcase
set ignorecase

let otl_install_menu=1
let maplocalleader = ","

if has("eval")
  let &cpo=cpo_save
  unlet cpo_save
endif

au BufNewFile,BufRead *.otl,*.txt,*.doc setf otl
au BufNewFile,BufRead *.otl,*.txt,*.doc set noexpandtab

