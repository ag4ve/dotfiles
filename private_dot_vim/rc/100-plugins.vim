
" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')

" Bundle stuff
Plug 'flazz/vim-colorschemes'

" If in vimdiff don't load plugins
if &diff

else
  Plug 'bogado/file-line'								" Open a file at a line number with <file>:<num>
  Plug 'ciaranm/securemodelines'				" Automatically add/use modeline. TODO Replace
  Plug 'jamessan/vim-gnupg'							" Encrypt/decrypt gpg files
  Plug 'kshenoy/vim-signature'					" Handle marks
  Plug 'mbbill/undotree'								" Visualize the undo tree
  Plug 'mg979/vim-visual-multi'					" Type with multiple cursors
  Plug 'tpope/vim-abolish' 							" handle word variations
  Plug 'tpope/vim-fugitive'							" git in vim
  Plug 'tpope/vim-repeat'								" Library to expand the use of '.'
  Plug 'tpope/vim-speeddating'					" C-A/C-X move time forward/backward
  Plug 'vim-scripts/Align'							" Align a block
  Plug 'wojtekmach/vim-rename'					" Rename the file
  if has('nvim')
    Plug 'rmagatti/auto-session'				" Save/load a session
    " Plug 'rafamadriz/friendly-snippets'
    " Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " lua windowing
    " Plug 'ray-x/navigator.lua' 					" Code analysis
  endif
endif

" All of your Plugins must be added before the following line
"call vundle#end()            " required
call plug#end()

