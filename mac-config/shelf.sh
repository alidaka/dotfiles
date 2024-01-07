#!/bin/sh -e

brew install scroll-reverser --cask
brew install tmux
brew install tree
brew install ripgrep
brew install jq
brew install foreman
brew install hammerspoon --cask
brew install alfred --cask
brew install signal --cask
brew install lunar --cask

#"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" --install-extension vscodevim.vim

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true; killall Finder

