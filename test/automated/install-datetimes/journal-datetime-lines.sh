#!/bin/sh
# Usage:
#
#   test/automated/install-datetimes/journal-datetime-lines.sh
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

# Install
#   Datetimes
#     Journal Datetime Lines

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q
local_dir="$project/slasher/local"
journal="$local_dir/journal/some-writer"
mkdir -p "$journal"
printf '# Some entry\n\nSat Nov 21 2026 at 18:01\n\n**Tags:** [progress]\n\nSome text.\n' > "$journal/2026-11-21T18-01-some-entry.md"
printf '# Some dated entry\n\nThu Aug 13 2026\n\n---\n\nAuthored by Some Writer on Fri Aug 14 2026 at 1:54:47 PM PT\n' > "$journal/2026-08-13-some-dated-entry.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

entry=$(cat "$journal/2026-11-21T18-01-some-entry.md")
control_entry=$(printf '# Some entry\n\n**Tags:** [progress]\n\nSome text.')
[ "$entry" = "$control_entry" ] || fail "Drops the datetime line under the title" "found:" "$entry"

entry=$(cat "$journal/2026-08-13-some-dated-entry.md")
control_entry=$(printf '# Some dated entry\n\n---\n\nAuthored by Some Writer on Fri Aug 14 2026 at 13:54:47 PT')
[ "$entry" = "$control_entry" ] || fail "Drops a date line, and converts the footer" "found:" "$entry"

[ -f "$journal/2026-08-13-some-dated-entry.md" ] || fail "Leaves a stamp with no time as it is"

echo "0 failed, 0 aborted"
