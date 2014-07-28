"cscope setting
let csdb=$PWD . "/cscope.out"
if filereadable(csdb)
    if filereadable('/usr/local/bin/cscope')
        set csprg='/usr/local/bin/cscope'
    else
        set csprg='/usr/bin/cscope'
    endif
    set cscopequickfix=c-,d-,e-,f-,g-,i-,s-,t-
    set csto=1
    set nocst
    set cspc=3

    set nocsverb
    cs add cscope.out
    set csverb

    nmap fc :cs f c <cword><cr>
    nmap fa :cs f t <cword><cr>
    nmap fd :cs f d <cword><cr>
    nmap ff :cs f f <cword><cr>
    nmap fg :cs f g <cword><cr>
    nmap fi :cs f i

    nmap cw :cw<cr>

endif
