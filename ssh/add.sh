#!/bin/sh
set -e

MINUTES=$1
if [ -z "$MINUTES" ]; then
  MINUTES=1
fi

# Mount and decrypt
SCRIPT_DIR=$(dirname "$0")
if [ "$OS" = "Darwin" ]; then
  # size in 512b sectors
  RAMDISK=$(hdiutil attach -nomount ram://$((2 * 1024 * 5)))
  diskutil eraseVolume HFS+ ramdisk "$RAMDISK"

  ssh-add -D
  ssh-add -t ${MINUTES}M

  echo "WIP"
  # umount -f ...
  # hdiutil detach ...
else
  if [ ! -d /dev/shm ]; then
    echo "$0 needs the /dev/shm memory-backed directory, but it seems to be missing :("
    exit 1
  fi

  TEMP_DIR=$(mktemp --directory --tmpdir=/dev/shm)
  "$SCRIPT_DIR/scripts/unlock.sh" "$SCRIPT_DIR/.ssh.gpg" "$TEMP_DIR"

  if [ -z "$SSH_AGENT_PID" ]; then
    eval $(ssh-agent -s)
  fi
  ssh-add -D
  ssh-add -t ${MINUTES}M "$TEMP_DIR/id_rsa"

  rm --recursive --force "$TEMP_DIR"
fi
