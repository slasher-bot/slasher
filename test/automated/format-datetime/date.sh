#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/date.sh
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
#   Date

# Controls -------------------------------------------------------------------

control_prefix=2026-11-22T02-01-28Z

# Actuation ------------------------------------------------------------------

formatted=$(TZ=America/Los_Angeles system/foundation/format-datetime.sh date "$control_prefix")

# Observation ----------------------------------------------------------------

[ "$formatted" = "Sat Nov 21 2026" ] || fail "Prints the local day, with its weekday and year" "found:" "$formatted"

echo "0 failed, 0 aborted"
