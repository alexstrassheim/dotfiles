#!/bin/bash

DOTDIR=${HOME}/dotfiles
ALACRITYDIR=${HOME}/.config/alacritty

if [ ! -d ${DOTDIR} ]; then
  echo "Creating and cloning dot project..."
  mkdir ${DOTDIR}
  git clone git@github.com:alexstrassheim/dotfiles.git ${DOTDIR}
else
  echo "Updating dot files..."
  cd ${DOTDIR}
  git pull
fi

if [ ! -d ${ALACRITYDIR} ]; then
  echo "Creating directory and installing config files in ${ALACRITYDIR}..."
  mkdir ${ALACRITYDIR}
fi

if [ ! -d ${NVIMDIR} ]; then
  echo "Creating directory and installing config files in ${NVIMDIR}..."
  mkdir ${NVIMDIR}
fi

ln -sf ${HOME}/dotfiles/alacritty.symlink.yml ${HOME}/.config/alacritty/alacritty.yml
ln -sf ${HOME}/dotfiles/zshrc.symlink ${HOME}/.zshrc
ln -sf ${HOME}/dotfiles/tmux.symlink.conf ${HOME}/.tmux.conf

echo '==========================================================================='
echo "Done!"
echo '==========================================================================='

