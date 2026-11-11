#!/bin/sh
# Usage:
#
#   slasher/system/imap/credential.sh read <host>
#   slasher/system/imap/credential.sh read --name <name>
#   slasher/system/imap/credential.sh write <host> <user> [--name <name>] < <credential>
#
# Reads the credential stored in the Keychain for an IMAP host, or
# by its name, and prints it. Or writes the credential given on standard
# input, replacing one already stored, with imap as its kind, which marks
# it as an IMAP account. IMAP_KEYCHAIN names a keychain file to use in
# place of the login keychain.
set -e

command=$1
host=$2
user=$3

case "$command" in
  read)
    if [ "$2" = --name ]; then
      security find-generic-password -l "$3" -w \
        ${IMAP_KEYCHAIN:+"$IMAP_KEYCHAIN"}
    else
      security find-generic-password -s "$host" -w \
        ${IMAP_KEYCHAIN:+"$IMAP_KEYCHAIN"}
    fi
    ;;
  write)
    credential=$(cat)
    if [ "$4" = --name ]; then
      set -- -l "$5"
    else
      set --
    fi
    security add-generic-password -U -s "$host" -a "$user" -D imap "$@" \
      -w "$credential" ${IMAP_KEYCHAIN:+"$IMAP_KEYCHAIN"}
    ;;
esac
