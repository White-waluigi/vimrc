#!/bin/bash


NEWLINE=$'\n'
cd ~/Documents/vimrc
A="$(find ~/.config/nvim/src)"
echo $A
A=$"${A}${NEWLINE}$(find ~/.config/nvim/init.vim)"
echo "${A}"
mkdir ~/.config/nvim
mkdir ~/.config/nvim/src
cp ~/Documents/vimrc/vimrc ~/.config/nvim/init.vim
cp -r ~/Documents/vimrc/src ~/.config/nvim/
echo "directories created"

~/Documents/vimrc/entrscript.sh
echo "$A" |  nohup entr ~/Documents/vimrc/entrscript.sh &

