#!/bin/sh
# Usage:
#
#   test/automated/smtp/send-host.sh
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
#     Host

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

cp test/automated/smtp/controls/message.eml "$directory/some-message.eml"

# The .invalid top-level domain never resolves, so the send names the host it
# tried and stops.
printf '%s' "some credential" | system/imap/credential.sh write imap.some-host.invalid some-user@example.com --name work-mail

# Actuation ------------------------------------------------------------------

output=$(system/smtp/send.py work-mail "$directory/some-message.eml" 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$output" = "The SMTP host smtp.some-host.invalid, port 465, could not be reached." ] || fail "Replaces the IMAP host's imap. with smtp." "status:" "$status" "output:" "$output"

echo "0 failed, 0 aborted"
