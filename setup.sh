#!/bin/bash

DOTDIR=${HOME}/dotfilesTWO
ALACRITYDIR=${HOME}/.config/alacritty
NVIMDIR=${HOME}/.config/nvim

if [ ! -d ${DOTDIR} ]; then
  mkdir ${DOTDIR}
  git clone git@github.com:alexstrassheim/dotfiles.git ${DOTDIR}
else
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
ln -sf ${HOME}/dotfiles/vimrc.symlink ${HOME}/.config/nvim/init.vim
ln -sf ${HOME}/dotfiles/coc-settings.symlink.json ${HOME}/.config/nvim/coc-settings.json
ln -sf ${HOME}/dotfiles/zshrc.symlink ${HOME}/.zshrc
ln -sf ${HOME}/dotfiles/tmux.symlink.conf ${HOME}/.tmux.conf

echo '==========================================================================='
echo "Done!"
echo '==========================================================================='

