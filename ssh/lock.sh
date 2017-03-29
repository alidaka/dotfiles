#/bin/sh
set -e

SOURCE=${1%/}
if [[ -z $SOURCE ]]; then
  /bin/echo "Usage: ${0} <source_directory>"
fi

DEST_GPG=$SOURCE.gpg
GPG_TTY=$(tty) /usr/bin/tar c $SOURCE | /usr/local/bin/gpg --symmetric --cipher-algo AES256 --output $SOURCE.gpg

/bin/echo $DEST_GPG
