" status line setting
set statusline=%P\ of\ %L\ [%l:%c#%n]\ %o\ %=[%B:%b]\ [%{FileEncoding()}\|%{FileFormat()}]\ %t%m%r%h%y

function! FileEncoding()
    let encoding=&fileencoding 
    return encoding
endfunction

function! FileFormat()
    let format=&fileformat
    return format
endfunction

