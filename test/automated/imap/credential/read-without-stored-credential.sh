#!/bin/sh
# Usage:
#
#   test/automated/imap/credential/read-without-stored-credential.sh
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
#     When no credential is stored

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

# Actuation ------------------------------------------------------------------

credential=$(system/imap/credential.sh read some-host 2>/dev/null) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] && [ -z "$credential" ] || fail "Fails" "status:" "$status" "credential:" "$credential"

echo "0 failed, 0 aborted"
