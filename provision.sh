#!/bin/bash

#############
# This script installs my most common config files to a new machine.
# Only tested on Mac OSX Yosemite
#############

#############
# Other installed software includes brew, fish shell, virtualfish, ack
# > ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# > brew install python
# > pip install virtualenv
# > pip install virtualfish
# > brew install ack
# > WHAT ELSE?
#############

# TODO: not DRY; create a function for this
if [ ! -f $HOME/.gitconfig ]; then
	echo "=> Linking .gitconfig"
    ln -s home/.gitconfig $HOME/.gitconfig
else
	echo "=> $HOME/.gitconfig already exists"
fi

if [ ! -f $HOME/.config/fish/config.fish ]; then
	echo "=> Linking config.fish"
	ln -s home/.config/fish/config.fish $HOME/.config/fish/config.fish
else
	echo "=> $HOME/.config/fish/config.fish already exists"
fi
