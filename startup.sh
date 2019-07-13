#!/bin/bash


NEWLINE=$'\n'
cd ~/Documents/vimrc
A="$(find ~/.config/nvim/src)"
echo $A
A=$"${A}${NEWLINE}$(find ~/.config/nvim/init.vim)"
echo "${A}"

nohup  echo "$A" | entr  ./entrscript.sh &
