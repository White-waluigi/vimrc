#!/bin/bash

echo "added new entry at $(date)" >>  ~/.vimrc_s
#cp -f ~/.vimrc vimrc
#cp -rf ~/.vim/src src
cp -f ~/.config/nvim/init.vim vimrc
cp -rf ~/.config/nvim/src src
git stage .
git commit -a -m "Entr auto update"
git push

echo "done" >> ~/.vimrc_s
