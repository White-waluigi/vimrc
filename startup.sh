#!/bin/bash

cd ~/Documents/vimrc
A="$(find ~/.vim/src)"
A="${A} ~/.vimrc"
echo $A

ls ~/.vimrc | entr ./entrscript.sh
