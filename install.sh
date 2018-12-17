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
vim -u NONE +PlugInstall +qall
echo "Done!"

echo "Install oh-my-zsh..."
if [ -d ~/.oh-my-zsh ]; then
  echo "Already installed; skipped!"
else
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  chsh -s $(which zsh)
  echo "Done!"
fi

echo "Install rvm/ruby..."
if command -v rvm 2>/dev/null; then
  echo "Already installed; skipped!"
else
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
  source /usr/local/rvm/scripts/rvm
  echo "Done!"
fi
