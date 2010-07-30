setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
nmap <F5> <Esc>:!python %<CR>
normal m`:%s/\s\+$//e ``
