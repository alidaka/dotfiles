#!/bin/sh
set -e

MINUTES=$1
if [[ -z $MINUTES ]]; then
  MINUTES=1
fi

# Mount and decrypt
if [[ "$OS" -eq "Darwin" ]]; then
  # size in 512b sectors
  RAMDISK=$(/usr/bin/hdiutil attach -nomount ram://$((2 * 1024 * 5)))
  /usr/sbin/diskutil eraseVolume HFS+ ramdisk $RAMDISK
else
  echo "linux...WIP"
  exit 1
fi

# Add key
/usr/bin/ssh-add -D
/usr/bin/ssh-add -t ${MINUTES}M

# Unmount
if [[ "$OS" -eq "Darwin" ]]; then
  # umount -f ...
  # hdiutil detach ...
else
  echo "linux...WIP"
  exit 1
fi
