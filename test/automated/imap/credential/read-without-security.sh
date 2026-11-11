#!/bin/sh
# Usage:
#
#   test/automated/imap/credential/read-without-security.sh
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
#     When security is not found

# Controls -------------------------------------------------------------------

control_path=/bin

# Actuation ------------------------------------------------------------------

message=$(PATH="$control_path" system/imap/credential.sh read some-host 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
case "$message" in
  *security*macOS*) ;;
  *) fail "Names macOS's security command as missing" "message:" "$message" ;;
esac

echo "0 failed, 0 aborted"
