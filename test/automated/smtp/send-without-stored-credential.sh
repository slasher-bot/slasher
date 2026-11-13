#!/bin/sh
# Usage:
#
#   test/automated/smtp/send-without-stored-credential.sh
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

# Smtp
#   Send
#     When no credential is stored under the name

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

cp test/automated/smtp/controls/message.eml "$directory/some-message.eml"

# Actuation ------------------------------------------------------------------

output=$(system/smtp/send.py some-missing-mail "$directory/some-message.eml" 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
[ "$output" = "No credential is stored under the name some-missing-mail." ] || fail "Names the missing credential" "output:" "$output"

echo "0 failed, 0 aborted"
