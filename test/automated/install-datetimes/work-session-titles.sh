#!/bin/sh
# Usage:
#
#   test/automated/install-datetimes/work-session-titles.sh
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
#     Work Session Titles

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q
local_dir="$project/slasher/local"
mkdir -p "$local_dir/logs/work-sessions"
sessions="$local_dir/logs/work-sessions"
printf '# Work Session — Some work (Sat Nov 21 2026 18:01)\n\nSome text (Sat Nov 21 2026).\n' > "$sessions/2026-11-22T02-01-28Z-some-work.md"
printf '# Work Session — Some other work (Fri Nov 20 2026)\n' > "$sessions/2026-11-21T02-01-28Z-some-other-work.md"
printf '# Session — Some earlier work (2026-07-26)\n' > "$sessions/2026-07-26T02-01-28Z-some-earlier-work.md"
printf '# Work Session — Some undated work\n' > "$sessions/2026-11-23T02-01-28Z-some-undated-work.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

title=$(sed -n 1p "$sessions/2026-11-22T02-01-28Z-some-work.md")
[ "$title" = "# Work Session — Some work" ] || fail "Drops a date and time from a title" "found:" "$title"

body=$(sed -n 3p "$sessions/2026-11-22T02-01-28Z-some-work.md")
[ "$body" = "Some text (Sat Nov 21 2026)." ] || fail "Leaves the body as it is" "found:" "$body"

title=$(sed -n 1p "$sessions/2026-11-21T02-01-28Z-some-other-work.md")
[ "$title" = "# Work Session — Some other work" ] || fail "Drops a date from a title" "found:" "$title"

title=$(sed -n 1p "$sessions/2026-07-26T02-01-28Z-some-earlier-work.md")
[ "$title" = "# Session — Some earlier work" ] || fail "Drops an ISO date from a Session title, and keeps the word Session" "found:" "$title"

title=$(sed -n 1p "$sessions/2026-11-23T02-01-28Z-some-undated-work.md")
[ "$title" = "# Work Session — Some undated work" ] || fail "Leaves an undated title as it is" "found:" "$title"

echo "0 failed, 0 aborted"
