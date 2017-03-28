#!/bin/sh -e

echo "WIP!!"
exit 1

HOURS=$1

/usr/bin/ssh-add -T

# if Darwin
brew tap homebrew/fuse
brew install Caskroom/cask/osxfuse
brew install ext4fuse
