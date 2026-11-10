#!/bin/sh
# Usage:
#
#   test/automated/imap/credential/write-with-name.sh
#
# Run from the repository root.
set -e

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

# Imap
#   Credential

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

control_credential="some credential"

# Actuation ------------------------------------------------------------------

printf '%s' "$control_credential" | system/imap/credential.sh write some-host some-user --name some-name

# Observation ----------------------------------------------------------------

credential=$(system/imap/credential.sh read --name some-name)

[ "$credential" = "$control_credential" ] || fail "" "credential:" "$credential"

echo "0 failed, 0 aborted"
