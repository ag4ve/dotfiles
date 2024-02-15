
" nice colorful ruler
" might want: https://github.com/Lokaltog/vim-powerline
set statusline=
set statusline+=%{getcwd()}>\
set statusline+=%1*%t%*\
set statusline+=%2*[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%*
set statusline+=%3*%h%m%r%y%*
set statusline+=%=%4*%c,%l/%L\ %P%*

