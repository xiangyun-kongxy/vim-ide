" path setting
set path=$PWD/**
let root_path=$PWD
autocmd BufEnter * silent! lcd %:p:h

