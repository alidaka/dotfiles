#!/bin/bash -e

echo "Install packages..."
PACKAGES="curl vim zsh gnupg direnv"
if [ $(uname -s) = "Darwin" ]; then
  brew install $PACKAGES
else
  apt update
  apt -y install $PACKAGES
fi
echo "Done!"

echo "Install vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
echo "Done!"

echo "Install oh-my-zsh..."
if [ -d ~/.oh-my-zsh ]; then
  echo "Already installed; skipped!"
else
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  chsh -s $(which zsh)
  echo "Done!"
fi
