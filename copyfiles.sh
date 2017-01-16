#!/bin/bash
# dotfiles.sh install script

if [[ $(uname) == "Linux" ]]; then
    echo "Copying ~/.bashrc..."
    cat files/bashrc > ~/.bashrc
fi

if [[ $(uname) == "Darwin" ]]; then
    echo "Copying ~/.bash_profile..."
    cat files/bash_profile > ~/.bash_profile
fi

echo "Copying ~/.vimrc..."
cat files/vimrc > ~/.vimrc

echo "Creating ~/.vim/backup dir..."
mkdir ~/.vim
mkdir ~/.vim/backup

echo "Copying ~/.inputrc..."
cat files/inputrc > ~/.inputrc

echo "Copying ~/.screenrc..."
cat files/screenrc > ~/.screenrc

echo "Copying ~/.NERDTreeBookmarks..."
cat files/NERDTreeBookmarks > ~/.NERDTreeBookmarks

echo "Done. Restart your shell"
