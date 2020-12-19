#!/bin/bash

#############
# This script installs my most common config files to a new machine.
# Only tested on Mac OSX Yosemite & El Capitan
#############

#############
# Other installed software includes brew, fish shell, virtualfish, ack, rbenv
# > ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# > brew install python
# > pip install virtualenv
# > pip install virtualfish
# > brew install ack
# > brew update
# > brew install rbenv
# > brew install ruby-build
# > rbenv install 2.2.0
# > rbenv local 2.2.0
# > WHAT ELSE?
#############

# TODO: not DRY; create a function for this
if [ -f $HOME/.gitconfig ]; then
	echo "=> $HOME/.gitconfig already exists"
else
	echo "=> Linking .gitconfig"
  ln -s $PWD/home/.gitconfig $HOME/.gitconfig
fi

if [ -f $HOME/.config/fish/config.fish ]; then
	echo "=> $HOME/.config/fish/config.fish already exists"
else
	echo "=> Linking config.fish"
	ln -s $PWD/home/.config/fish/config.fish $HOME/.config/fish/config.fish
fi

if [ -f $HOME/.nanorc ]; then
	echo "=> $HOME/.nanorc already exists"
else
	echo "=> Linking ~/.nanorc"
	ln -s $PWD/home/fish.nanorc $HOME/.nanorc
fi
