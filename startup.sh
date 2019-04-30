#!/bin/bash

cd ~/Documents/vimrc
A="$(ls ~/.vim/src)"
A.=" ~/.vimrc"
echo $A

ls ~/.vimrc | entr ./entrscript.sh
