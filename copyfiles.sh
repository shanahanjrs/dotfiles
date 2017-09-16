#!/bin/bash
# dotfiles.sh install script

echo 'Installing dotfiles...'
echo '----------------------'

if [[ $(uname) == 'Linux' ]]; then
    echo 'Copying ~/.bashrc...'
    cat files/bash_profile > ~/.bashrc
fi

if [[ $(uname) == 'Darwin' ]]; then
    echo 'Copying ~/.bash_profile...'
    cat files/bash_profile > ~/.bash_profile
fi

echo 'Copying ~/.zshrc...'
cat files/zshrc > ~/.zshrc

if [[ -d ~/.oh-my-zsh ]]; then
    echo 'Copying ~/.oh-my-zsh/themes/jrs.zsh-theme...'
    cp files/jrs.zsh-theme ~/.oh-my-zsh/themes
else
    echo 'You do not have oh-my-zsh installed at ~/.oh-my-zsh. Please install and rerun...'
fi

echo 'Copying ~/.vimrc...'
cat files/vimrc > ~/.vimrc

echo 'Creating ~/.vim/backup dir...'
mkdir ~/.vim
mkdir ~/.vim/backup

echo 'Installing Vundle...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Copying ~/.inputrc...'
cat files/inputrc > ~/.inputrc

echo 'Copying ~/.screenrc...'
cat files/screenrc > ~/.screenrc

echo 'Copying ~/.NERDTreeBookmarks...'
cat files/NERDTreeBookmarks > ~/.NERDTreeBookmarks

echo 'Installing vim plugins...'
vim +PluginUpdate +qall

echo 'Done. Restart your shell'
