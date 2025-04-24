#!/bin/bash -e

source_dir=$( cd $(dirname $0) ; pwd -P )
backup=~/dotfiles_backup
files="vimrc gitconfig tmux.conf zshrc hammerspoon/init.lua"

if [ -d $backup ]; then
  echo "Dotfiles backup directory $backup already exists--aborting!"
  exit 1
elif [ -f $backup ]; then
  echo "Dotfiles backup directory $backup conflicts with an existing file of the same name--aborting!"
  exit 1
else
  echo "Backing up existing dotfiles to $backup..."
fi

for file in $files; do
  dest=~/.$file
  echo "$file --> $dest"

  if [ -f $dest ] || [ -h $dest ]; then
    echo "  Backing up $dest to $backup..."
    mkdir -p $backup
    mv $dest $backup
  fi

  echo "  Creating link for $file..."
  ln -s $source_dir/$file $dest
  echo
done

# Remaining one-offs
echo "Creating vim directories..."
mkdir -p ~/temp
mkdir -p ~/.vimswap
echo

echo "All done!"
