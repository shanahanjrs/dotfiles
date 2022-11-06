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

safe_ln_s bash_aliases
safe_ln_s tmux.conf
safe_ln_s vimrc
safe_ln_s inputrc
make_vim

# Make Linux/Macos specific updates
if [[ $(uname) == 'Linux' ]]; then
    echo 'Copying ~/.bashrc...'
    cat files/bash_profile > ~/.bash_profile
    echo 'source ~/.bash_profile' >> ~/.bashrc
    # If we're on Linux and not Mac add the pbcopy/pbpaste aliases
    echo "alias pbcopy='xsel --clipboard --input'" >> ~/.bash_aliases
    echo "alias pbpaste='xsel --clipboard --output'" >> ~/.bash_aliases
fi

if [[ $(uname) == 'Darwin' ]]; then
    echo 'Copying ~/.bash_profile...'
    cat files/bash_profile > ~/.bash_profile
    # Set bash as the default sh
    chsh -s /bin/bash
    echo "[NOTE] Do not forget to install brew and upgrade bash"
    echo "[NOTE] brew install bash"
    echo "[NOTE] add: '/opt/homebrew/bin/bash to /etc/shells'"
    echo "[NOTE] then: chsh -s /opt/homebrew/bin/bash"
fi

echo 'Done. Restart your shell'
