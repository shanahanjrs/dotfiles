#!/bin/bash
# dotfiles.sh install script

if [[ $(uname) == "Linux" ]]; then
    echo "Installing ~/.bashrc..."
    cat files/bashrc > ~/.bashrc
fi

if [[ $(uname) == "Darwin" ]]; then
    echo "Installing ~/.bash_profile..."
    cat files/bash_profile > ~/.bash_profile
fi

echo "Installing ~/.vimrc..."
cat files/vimrc > ~/.vimrc

echo "Installing ~/.inputrc..."
cat files/inputrc > ~/.inputrc

echo "Installing ~/.screenrc..."
cat files/screenrc > ~/.screenrc

echo "Installing ~/.NERDTreeBookmarks..."
cat files/NERDTreeBookmarks > ~/.NERDTreeBookmarks

echo "Done. Restart your shell"
