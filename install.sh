#!/usr/bin/sh

# dotfiles.sh install script

echo "Run from dotfiles/ directory"

cat files/bashrc > ~/.bashrc
cat files/vimrc > ~/.vimrc
cat files/inputrc > ~/.inputrc
cat files/screenrc > ~/.screenrc
cat files/NERDTreeBookmarks > ~/.NERDTreeBookmarks
