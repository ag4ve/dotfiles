
" toggle cwd function
au VimEnter * :let s:curdir = getcwd()
function! <sid>AdjustCWD()
    if getcwd() == s:curdir
        lcd %:h
    else
        exe 'lcd' s:curdir
    endif
endfunction

" toggle the cwd vim was opened in vs the cwd of the file
map <silent> <F5> :<c-u>call <sid>AdjustCWD()<CR>

