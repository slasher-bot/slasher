#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/iso-date-short-time.sh
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
#   Iso Date Short Time

# Controls -------------------------------------------------------------------

control_prefix=2026-11-22T02-01-28Z

# Actuation ------------------------------------------------------------------

formatted=$(TZ=America/Los_Angeles system/foundation/format-datetime.sh iso-date-short-time "$control_prefix")

# Observation ----------------------------------------------------------------

[ "$formatted" = "2026-11-21T18-01" ] || fail "Prints the local time to the minute, with no suffix" "found:" "$formatted"

echo "0 failed, 0 aborted"
