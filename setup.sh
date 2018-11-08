#!/bin/bash

# Update if it's already installed or download it if it's not
if [ -d $HOME/.dotfiles ]; then
  cd $HOME/.dotfiles
  git pull
else
  git clone git@github.com:alexstrassheim/dotfiles.git $HOME/.dotfiles
fi

# Symlink all of our dotfiles to the home directory
for i in vimrc zshrc tmux.conf;
do
  ln -sf $HOME/.dotfiles/$i $HOME/.$i
done
