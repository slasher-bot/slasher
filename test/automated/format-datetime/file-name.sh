#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/file-name.sh
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

# Format Datetime
#   File Name

# Controls -------------------------------------------------------------------

control_prefix=2026-11-22T02-01-28Z-some-record.md

# Actuation ------------------------------------------------------------------

formatted=$(TZ=America/Los_Angeles system/foundation/format-datetime.sh short-date "$control_prefix")

# Observation ----------------------------------------------------------------

[ "$formatted" = "Sat Nov 21" ] || fail "Reads the prefix of a file name" "found:" "$formatted"

echo "0 failed, 0 aborted"
