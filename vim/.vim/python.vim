set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set spelllang=en_us

"comment lines in visual and normal mode with CTRL-r and uncomment with CTRL-t
:vmap <silent> <F3> :s/^/#/g<s-enter>
:nmap <silent> <F3> ^i#<esc>
:vmap <silent> <F4> :s/#//g<s-enter>
:nmap <silent> <F4> ^x<esc>
