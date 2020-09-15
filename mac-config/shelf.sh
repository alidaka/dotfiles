#!/bin/sh -e

brew cask install shiftit
brew cask install scroll-reverser
brew install tmux
brew install tree
brew install ripgrep

"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" --install-extension vscodevim.vim
