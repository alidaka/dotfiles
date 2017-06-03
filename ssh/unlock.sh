#!/bin/sh
set -e

SOURCE=$1
SECONDS=$2
if [ -z "$SOURCE" ] || [ -z "$SECONDS" ]; then
  echo "Usage: ${0} <source_file.tar.gpg> <seconds> [destination_directory]"
  exit 1
fi

DEST=${3}
if [ -z "$DEST" ]; then
  DEST=`mktemp --directory -p /dev/shm`
fi

gpg --decrypt "$SOURCE" | tar xf - -C "$DEST"

sleep $SECONDS && rm -rf $DEST &
