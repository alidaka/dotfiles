#!/bin/bash -e

source_dir=$( cd $(dirname $0) ; pwd -P )
files="vimrc gitconfig tmux.conf zshrc hammerspoon/init.lua"

# Prep for backup (if needed)
backup=~/dotfiles_backup
if [ -d $backup ]; then
  echo "Dotfiles backup directory $backup already exists--aborting!"
  exit 1
elif [ -f $backup ]; then
  echo "Dotfiles backup directory $backup conflicts with an existing file of the same name--aborting!"
  exit 1
else
  echo "Backing up existing dotfiles to $backup..."
fi

backup() {
  if [ -f $1 ] || [ -h $1 ]; then
    echo "  Backing up $1 to $backup..."
    mkdir -p $backup
    mv $1 $backup
  fi
}

# Most of the files
for file in $files; do
  dest=~/.$file
  echo "$file --> $dest"

  backup $dest

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
