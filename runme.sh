#!/bin/bash

source_dir=`dirname $0`
backup=~/dotfiles_backup
files="bashrc vimrc gitconfig tmux.conf profile bash_profile"

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

  if [ -f $dest ]; then
    echo "| Backing up $dest to $backup..."
    mkdir -p $backup
    mv $dest $backup
  fi

  echo "| Creating link for $file..."
  ln -s $source_dir/$file $dest
  echo
done

echo "All done!"
