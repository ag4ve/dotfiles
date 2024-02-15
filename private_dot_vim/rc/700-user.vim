
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" remap leader (\) to ,
let mapleader=","
let g:mapleader=","

autocmd BufEnter * :syntax sync fromstart
"autocmd BufRead *.js set filetype=javascript

" center page on next match
nnoremap n nzz
nnoremap N Nzz

" center page on next/previous location
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Move the screen with J/K
nnoremap J <C-e>
nnoremap K <C-y>

" tn = tabnew, tm = tabmove
cmap tn tabnew
cmap tm tabmove

" jump to next/prev row
nnoremap j gj
nnoremap k gk

" insert blank lines
map <leader>o o<Esc>k
map <leader>O O<Esc>j

