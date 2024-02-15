
" toggle features that mess up pasting
map <silent> <F2> :set invpaste<CR>

" toggle line numbers
map <silent> <F3> :set invnumber<CR>

" toggle hilight search
map <silent> <F4> :set hlsearch!<CR>:echom 'hlsearch: ' . ['Off', 'On'][&hlsearch]<CR>

" toggle undotree
map <silent> <F7> :UndotreeToggle<CR>

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

