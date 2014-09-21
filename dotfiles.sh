#!/bin/bash

##############################################################
#dotfiles.sh
# John Shanahan
# Makes and retrieves your dotfiles from your github account.

# TODO
# Add option to delete everything on logout using .bash_logout


# Must be run with 'sudo'
if [ "$(id -u)" != "0" ]; then
    echo "Please run script with '$ sudo dotfiles'"
    exit 1
fi

