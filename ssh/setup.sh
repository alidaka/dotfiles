#!/bin/sh
set -e

DEST=${1%/}
if [ -z "$DEST" -o \
  "$DEST" = "-?" -o "$DEST" = "/?" -o \
  "$DEST" = "-h" -o "$DEST" = "/h" -o \
  "$DEST" = "--help" ]
then
  echo "Usage: ${0} <target_dir>"
  echo
  echo "This will create a file structure like:"
  echo "    target_dir/add.sh"
  echo "    target_dir/scripts/generate.sh"
  echo "    target_dir/scripts/lock.sh"
  echo "    target_dir/scripts/unlock.sh"
  echo "    target_dir/.ssh.gpg"
  exit 1
fi

SCRIPT_DIR=$(dirname "$0")

cp --no-clobber --target-directory="$DEST" "$SCRIPT_DIR/add.sh"
mkdir --parents "$DEST/scripts"
cp --no-clobber --target-directory="$DEST/scripts" "$SCRIPT_DIR/generate.sh"
cp --no-clobber --target-directory="$DEST/scripts" "$SCRIPT_DIR/lock.sh"
cp --no-clobber --target-directory="$DEST/scripts" "$SCRIPT_DIR/unlock.sh"

cp --no-clobber --target-directory="$DEST/scripts" "$SCRIPT_DIR/unlock.sh"

"$SCRIPT_DIR/lock.sh" ~/.ssh "$DEST/.ssh.gpg"
