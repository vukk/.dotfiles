#!/bin/sh

source ./start

if [ -z "$DOTFILES" ] || [ -z "$APPDATA" ]; then
	echo 'Configure DOTFILES and APPDATA paths to "start"-file first'
	exit 1
fi

echo "Creating .appdata directory"
mkdir -p $APPDATA/history/

echo "Backing up current bash & zsh RCs on homedir"
test -f ~/.bashrc && cp ~/.bashrc ~/.bashrc.bak
test -f ~/.bash_profile && cp ~/.bash_profile ~/.bash_profile.bak
test -f ~/.zshrc && cp ~/.zshrc ~/.zshrc.bak

echo "Softlinking bash & zsh RCs to homedir"
ln -sf $DOTFILES/shells/home/bashrc ~/.bashrc
ln -sf $DOTFILES/shells/home/bash_profile ~/.bash_profile
ln -sf $DOTFILES/shells/home/zshrc ~/.zshrc
