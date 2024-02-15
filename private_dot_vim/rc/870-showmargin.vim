
let ext_blacklist = ['conf', 'vim']

" show when we go part margins
augroup show_overflow
  autocmd!
  highlight OverLength term=bold cterm=bold guibg=#ce4e4e
  autocmd BufEnter *
    \ if (len(&ft) == 0 || len(&ft) > 0 && index(ext_blacklist, &ft) < 0) |
    \   match OverLength /\%>80v.\+/ |
    \ endif
augroup END

