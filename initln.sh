#!/bin/bash

PWD=`pwd`

mkdir ./backup
git submodule init
git submodule update

cp -R ~/.config/pianobar ./backup
ln -fs $PWD/pianobar ~/.config/pianobar

cp ~/.tmux.conf ./backup
ln -fs $PWD/tmux.conf ~/.tmux.conf

cp ~/.vimrc ./backup
ln -fs $PWD/vimrc ~/.vimrc

mv -R ~/.vim ./backup
mkdir -p ./vim/swpfiles
mkdir -p ./vim/undos
ln -fs $PWD/vim ~/.vim

cp ~/.Xdefaults ./backup
ln -fs $PWD/Xdefaults ~/.Xdefaults

cp ~/.xinitrc ./backup
ln -fs $PWD/xinitrc ~/.xinitrc

cp ~/.xmonad/xmonad.hs ./backup
ln -fs $PWD/xmonad.hs ~/.xmonad/xmonad.hs

cp ~/.zshenv ./backup
ln -fs $PWD/zshenv ~/.zshenv

cp ~/.zshrc ./backup
ln -fs $PWD/zshrc ~/.zshrc

# make sure bundles are installed
vim +BundleInstall +qall

