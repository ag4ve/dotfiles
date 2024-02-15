
" detect file type
filetype on
filetype plugin on
filetype indent on

set viminfo='20,\"100,:200,%,n~/.viminfo

set expandtab       " use spaces for tab
set tabstop=2       " spaces to display for tab
set shiftwidth=2    " C-indent (cin) width
set softtabstop=2   " spaces to move typing tab
set textwidth=74    " Line break after 74 cols of text
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
set hidden          " change buffer without writing
set scrolloff=3     " scroll before we hit the bottom
set wildmode=list:longest   " command autocomplete like a shell
set laststatus=2    " see the statusline when looking at one file
set magic           " set magic on, for regular expressions
set cursorline      " enable current line hilight features
set autoindent
set cindent         " autoindent code
set spelllang=en_us
set spellfile=~/.vim/spell.en.utf-8.add
set updatetime=5000 " milliseconds

syntax on           " syntax hilight

set cinkeys=0{,0},0(,0),:,:0#,!^F,o,0,e
set cinoptions=>s,e0,n-2,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,ps,t0,is,+s,c3,C0,/0,(-2s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0

set sessionoptions=
set sessionoptions+=blank,buffers,curdir,folds,globals,help,localoptions
set sessionoptions+=options,resize,tabpages,winsize,winpos

