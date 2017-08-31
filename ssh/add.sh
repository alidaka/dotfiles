#!/bin/sh
set -e

MINUTES=$1
if [ -z "$MINUTES" ]; then
  MINUTES=1
fi

if [ -z "$SSH_AGENT_PID" ]; then
  echo "Please start the ssh-agent, e.g.:"
  echo
  echo "    eval \$(ssh-agent -s)"
  echo
  exit 1
fi

# Mount and decrypt
SCRIPT_DIR=$(dirname "$0")
if [ "$OS" = "Darwin" ]; then
  # TODO: still untested (lock.sh fails with gpg TTY problem?)

  # size in 512b sectors
  SIZE_IN_MB=5
  RAMDISK=$(hdiutil attach -nomount ram://$((2 * 1024 * SIZE_IN_MB)))
  diskutil eraseVolume HFS+ ramdisk "$RAMDISK"

  TEMP_DIR=/Volumes/ramdisk
  sh "$SCRIPT_DIR/.scripts/unlock.sh" "$SCRIPT_DIR/.ssh.gpg" "$TEMP_DIR"
  ssh-add -D
  ssh-add -t ${MINUTES}M "$TEMP_DIR/id_rsa"

  umount -f "$TEMP_DIR"
  hdiutil detach "$RAMDISK"
else
  if [ ! -d /dev/shm ]; then
    echo "$0 needs the /dev/shm memory-backed directory, but it seems to be missing :("
    exit 1
  fi

  TEMP_DIR=$(mktemp --directory --tmpdir=/dev/shm)
  sh "$SCRIPT_DIR/.scripts/unlock.sh" "$SCRIPT_DIR/.ssh.gpg" "$TEMP_DIR"
  ssh-add -D
  ssh-add -t ${MINUTES}M "$TEMP_DIR/.ssh/id_rsa"

  rm --recursive --force "$TEMP_DIR"
fi
