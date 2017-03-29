#/bin/sh
set -e

SOURCE=$1
if [[ -z $SOURCE ]]; then
  /bin/echo "Usage: ${0} <source_file.tar.gpg> [destination_directory]"
  exit 1
fi

DEST=${2}
if [[ -z $DEST ]]; then
  DEST=${PWD}
fi

/usr/local/bin/gpg --decrypt $SOURCE | tar -C $DEST xf -
