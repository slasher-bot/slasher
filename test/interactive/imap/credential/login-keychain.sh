#!/bin/sh
# A credential is written to and read from the login keychain.
#
# Usage:
#
#   test/interactive/imap/credential/login-keychain.sh
#
# Run from the repository root. The engineer runs it, since it writes to
# their login keychain, and macOS may ask them to allow access.
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
#     Login keychain

# Controls -------------------------------------------------------------------

unset IMAP_KEYCHAIN
trap 'security delete-generic-password -s imap.test.invalid >/dev/null 2>&1' EXIT

control_credential="some credential"

echo "macOS may ask whether security can use the item. Choose Allow."

# Actuation ------------------------------------------------------------------

printf '%s' "$control_credential" | system/imap/credential.sh write imap.test.invalid someone@test.invalid --name slasher-test

credential=$(system/imap/credential.sh read --name slasher-test)

# Observation ----------------------------------------------------------------

[ "$credential" = "$control_credential" ] || fail "" "credential:" "$credential"

echo "0 failed, 0 aborted"
