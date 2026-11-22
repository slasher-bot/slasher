#!/bin/sh
# Usage:
#
#   test/automated/format-datetime/present-moment.sh
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
#   Present Moment

# Controls -------------------------------------------------------------------

control_day=$(TZ=America/Los_Angeles date +%Y-%m-%d)

# Actuation ------------------------------------------------------------------

formatted=$(TZ=America/Los_Angeles system/foundation/format-datetime.sh iso-date)

# Observation ----------------------------------------------------------------

[ "$formatted" = "$control_day" ] || fail "Prints the present moment where no prefix is given" "found:" "$formatted"

echo "0 failed, 0 aborted"
