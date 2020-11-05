#!/bin/bash
# dotfiles.sh install script

safe_ln_s() {
    echo "Symlinking $1..."
    if [[ -f ~/.$1 ]]; then
        echo "Found ~/.$1, moving it to ~/.$1-ORIGINAL..."
        mv ~/.$1 ~/.$1-ORIGINAL
    fi
    ln -s ~/.config/dotfiles/files/$1 ~/.$1
}

make_vim() {
    echo 'Creating ~/.vim/backup dir...'
    mkdir ~/.vim
    mkdir ~/.vim/backup

    echo 'Installing Vundle...'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo 'Installing vim plugins...'
    vim +PluginUpdate +qall
}

echo 'Installing dotfiles...'
echo '----------------------'

safe_ln_s zshrc
safe_ln_s bash_aliases
safe_ln_s tmux.conf
safe_ln_s vimrc
safe_ln_s inputrc
safe_ln_s screenrc
safe_ln_s NERDTreeBookmarks
make_vim

# Make bashrc/bash_profile
if [[ $(uname) == 'Linux' ]]; then
    echo 'Copying ~/.bashrc...'
    cat files/bash_profile > ~/.bashrc
fi
if [[ $(uname) == 'Darwin' ]]; then
    echo 'Copying ~/.bash_profile...'
    cat files/bash_profile > ~/.bash_profile
fi

# Make zsh theme
if [[ -d ~/.oh-my-zsh ]]; then
    echo 'Copying ~/.oh-my-zsh/themes/jrs.zsh-theme...'
    cp files/jrs.zsh-theme ~/.oh-my-zsh/themes
else
    echo 'You do not have oh-my-zsh installed at ~/.oh-my-zsh. Please install and rerun...'
fi

echo 'Done. Restart your shell'
