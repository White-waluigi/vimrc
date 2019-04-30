#!/bin/bash


NEWLINE=$'\n'
cd ~/Documents/vimrc
A="$(find ~/.vim/src)"
echo $A
A=$"${A}${NEWLINE}$(find ~/.vimrc)"
echo "${A}"

echo "$A" | entr ./entrscript.sh
