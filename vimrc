
let $PAGER=''       " clear PAGER so vim can take over the task

set nocompatible               " be iMproved
filetype on                   " required!

runtime macros/matchit.vim

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set viminfo='20,\"100,:200,%,n~/.viminfo

set ts=4 st=4 ht=4 et

set shortmess=atI   " TODO look up
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set ruler           " show <line>,<col> <% file>
set mouse=a         " enable the mouse
set history=1000    " remember more commands and search history
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
set backspace=2     " make backspace work like most other apps
set wildignore=*.swp,*.bak,*.pyc,*.class
set iskeyword+=-    " match key-word because if gd thing-name, i want to select the whole thing-name 
set winheight=20
set winminheight=5
set hidden          " change buffer without writing
set scrolloff=3     " scroll before we hit the bottom
set wildmode=list:longest   " command autocomplete like a shell
let mapleader=","   " remap leader (\) to ,
set laststatus=2    " see the statusline when looking at one file

set sessionoptions=
set sessionoptions+=blank,buffers,curdir,folds,globals,help,localoptions
set sessionoptions+=options,resize,tabpages,winsize,winpos

" tell it to use an undo file
set undofile
" set a directory to store the undo history, for example:
set undodir=$HOME/.vim/undos/
" How many undos
set undolevels=1000
" number of lines to save for undo
set undoreload=10000

" swp file and backup path
set backupdir=$HOME/.vim/swpfiles/
set directory=$HOME/.vim/swpfiles/

" nice colorful ruler
" might want: https://github.com/Lokaltog/vim-powerline
hi User1 ctermbg=blue ctermfg=green guibg=blue guifg=green
hi User2 ctermbg=gray ctermfg=black guibg=gray guifg=black
hi User3 ctermbg=red ctermfg=blue guibg=red guifg=blue
hi User4 ctermbg=blue ctermfg=black guibg=blue guifg=black
set statusline=
set statusline+=%{getcwd()}>\ 
set statusline+=%1*%t%*\ 
set statusline+=%2*[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%*
set statusline+=%3*%h%m%r%y%*
set statusline+=%=%4*%c,%l/%L\ %P%*

" Copy to X CLIPBOARD
map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>

" syntax hilight
syntax on

autocmd BufEnter * :syntax sync fromstart
"autocmd BufRead *.js filetype=javascript

" detect file type
filetype plugin indent on

" disable features that mess up pasting
set pastetoggle=<F2>

" use ; instead of :
nnoremap ; :

" jump to next/prev row
nnoremap j gj
nnoremap k gk

" lustyjuggler map
nmap <silent> <Leader>j :LustyJuggler<CR>

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

au VimEnter * :let s:curdir = getcwd()
fu! <sid>AdjustCWD()
    if getcwd() == s:curdir
        lcd %:h
    else
        exe 'lcd' s:curdir
    endif
endfu

map <silent> <F5> :<c-u>call <sid>AdjustCWD()<cr>

" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
" JavaScript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set sw=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set sts=4


" Bundle stuff

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle "pangloss/vim-javascript"

Bundle "benmills/vimux"

Bundle "xolox/vim-session"
