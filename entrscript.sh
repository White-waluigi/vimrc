#!/bin/bash

cp -f ~/.vimrc vimrc
cp -rf ~/.vim/src src
git stage .
git commit -a -m "Entr auto update"
git push

