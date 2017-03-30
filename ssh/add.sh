#!/bin/sh
set -e

MINUTES=$1
if [ -z "$MINUTES" ]; then
  MINUTES=1
fi

# Mount and decrypt
if [ "$OS" = "Darwin" ]; then
  # size in 512b sectors
  RAMDISK=$(hdiutil attach -nomount ram://$((2 * 1024 * 5)))
  diskutil eraseVolume HFS+ ramdisk "$RAMDISK"
else
  echo "linux...WIP"
  exit 1
fi

# Add key
ssh-add -D
ssh-add -t ${MINUTES}M

# Unmount
if [ "$OS" = "Darwin" ]; then
  echo "WIP"
  # umount -f ...
  # hdiutil detach ...
else
  echo "linux...WIP"
  exit 1
fi
