#/bin/sh
set -e

SOURCE=${1%/}
if [[ -z $SOURCE ]]; then
  /bin/echo "Usage: ${0} <source_directory> [output_file]"
  exit 1
fi

DEST=${2}
if [[ -z $DEST ]]; then
  DEST=$SOURCE.gpg
fi

GPG_TTY=$(tty) /usr/bin/tar c $SOURCE | /usr/local/bin/gpg --symmetric --cipher-algo AES256 --output $DEST

/bin/echo $DEST
