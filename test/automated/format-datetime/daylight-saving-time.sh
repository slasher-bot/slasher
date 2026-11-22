#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/daylight-saving-time.sh
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
#   Daylight Saving Time

# Controls -------------------------------------------------------------------

control_prefix=2026-07-01T20-40-00Z

# Actuation ------------------------------------------------------------------

formatted=$(TZ=America/Los_Angeles system/foundation/format-datetime.sh date-time-text "$control_prefix")

# Observation ----------------------------------------------------------------

[ "$formatted" = "Wed Jul 1 2026 at 13:40:00 PT" ] || fail "Prints the zone abbreviation, not the season's" "found:" "$formatted"

echo "0 failed, 0 aborted"
