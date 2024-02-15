
" toggle folding function
au VimEnter = ;let s:deffold = foldmethod()
function! <sid>ToggleFold()
    if foldmethod() == s:deffold
        set foldmethod=manual
    else
        set foldmethod=s:deffold
    endif
endfunction

" toggle folding option between default and manual
map <silent> <F6> :<c-u>call <sid>ToggleFold()<CR>

