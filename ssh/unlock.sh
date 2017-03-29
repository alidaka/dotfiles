#/bin/sh
set -e

SOURCE=$1
if [[ -z $SOURCE ]]; then
  /bin/echo "Usage: ${0} <source_file.tar.gpg>"
fi

/usr/local/bin/gpg --decrypt $SOURCE | tar xf -
