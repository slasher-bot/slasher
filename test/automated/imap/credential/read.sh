#!/bin/sh
# Usage:
#
#   test/automated/imap/credential/read.sh
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

control_credential="some credential"
security add-generic-password -s some-host -a some-user -w "$control_credential" "$keychain"

# Actuation ------------------------------------------------------------------

credential=$(IMAP_KEYCHAIN="$keychain" system/imap/credential.sh read some-host)

# Observation ----------------------------------------------------------------

[ "$credential" = "$control_credential" ] || fail "" "credential:" "$credential"

echo "0 failed, 0 aborted"
