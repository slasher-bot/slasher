#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/unknown-format.sh
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
#   Unknown Format

# Controls -------------------------------------------------------------------

control_format=some-format

# Actuation ------------------------------------------------------------------

if system/foundation/format-datetime.sh "$control_format" 2026-11-22T02-01-28Z > /dev/null 2>&1; then
  status=0
else
  status=$?
fi

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] || fail "Fails"

echo "0 failed, 0 aborted"
