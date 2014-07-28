" syntastic setting
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_include_dirs = [ root_path ]
let g:syntastic_cpp_compiler_options = ''
let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_cpp_checkers = ['gcc']

let g:syntastic_python_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_python_checkers = ['python']

map <c-c> :SyntasticCheck <cr>
map er :Errors<cr>

autocmd BufWritePost *.h,*.c,*.cpp,*.hpp,*.cc SyntasticCheck

