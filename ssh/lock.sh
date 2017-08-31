#!/bin/sh
set -e

SOURCE=${1%/}
if [ -z "$SOURCE" ]; then
  echo "Usage: ${0} <source_directory> [output_file]"
  exit 1
fi

PARENT=$(dirname $SOURCE)
BASE=$(basename $SOURCE)

DEST=${2}
if [ -z "$DEST" ]; then
  DEST=$BASE.gpg
fi

GPG_TTY=$(tty)
export GPG_TTY
tar c --directory="$PARENT" "$BASE" | gpg --symmetric --cipher-algo AES256 --output "$DEST"

echo "$DEST"
