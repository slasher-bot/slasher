#!/bin/sh
# Usage:
#
#   test/automated/install-datetimes/footers.sh
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
#     Footers

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q
local_dir="$project/slasher/local"
mkdir -p "$local_dir/items"
item="$local_dir/items/2026-11-22T02-01-28Z-some-item.md"
cat > "$item" <<'ITEM'
# Some item

Some text written on Mon Oct 26 2026 at 5:52:41 PM PT.

---

Authored by Some Writer on Sat Jun 27 2026 at 1 PM PT
Changed by Some Writer on Mon Oct 26 2026 at 5:52:41 PM PT
Changed by Some Writer on Tue Oct 27 2026 at 12:06:51 AM PT
Changed by Some Writer on Tue Oct 27 2026 at 12:29:24 PM PT
Changed by Some Writer on Tue Oct 27 2026 at 9:01:02 AM PT
Changed by Some Writer on Sat Nov 21 2026 at 18:31:40 PT
ITEM

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

footer=$(sed -n '/^---$/,$p' "$item" | sed 1,2d)
control_footer=$(printf '%s\n' \
  'Authored by Some Writer on Sat Jun 27 2026 at 1 PM PT' \
  'Changed by Some Writer on Mon Oct 26 2026 at 17:52:41 PT' \
  'Changed by Some Writer on Tue Oct 27 2026 at 00:06:51 PT' \
  'Changed by Some Writer on Tue Oct 27 2026 at 12:29:24 PT' \
  'Changed by Some Writer on Tue Oct 27 2026 at 09:01:02 PT' \
  'Changed by Some Writer on Sat Nov 21 2026 at 18:31:40 PT')
[ "$footer" = "$control_footer" ] || fail "Converts 12-hour footer lines with seconds to 24-hour, and leaves the rest" "found:" "$footer"

body=$(sed -n 3p "$item")
[ "$body" = "Some text written on Mon Oct 26 2026 at 5:52:41 PM PT." ] || fail "Leaves a time outside the footer as it is" "found:" "$body"

echo "0 failed, 0 aborted"
