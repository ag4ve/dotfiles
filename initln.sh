#!/bin/bash

PWD=`pwd`

mkdir ./backup

cp -R ~/.config/pianobar ./backup
ln -s $PWD/pianobar ~/.config/pianobar

cp ~/.tmux.conf ./backup
ln -s $PWD/tmux.conf ~/.tmux.conf

cp ~/.vimrc ./backup
ln -s $PWD/vimrc ~/.vimrc

cp ~/.Xdefaults ./backup
ln -s $PWD/Xdefaults ~/.Xdefaults

cp ~/.xinitrc ./backup
ln -s $PWD/xinitrc ~/.xinitrc

cp ~/.xmonad/xmonad.hs ./backup
ln -s $PWD/xmonad.hs ~/.xmonad/xmonad.hs

cp ~/.zshenv ./backup
ln -s $PWD/zshenv ~/.zshenv

cp ~/.zshrc ./backup
ln -s $PWD/zshrc ~/.zshrc

