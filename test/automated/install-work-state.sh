#!/bin/sh
# Usage:
#
#   test/automated/install-work-state.sh
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

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT
installer="$(pwd)/system/foundation/install.sh"
items_dir="$project/slasher/local/items"

# The text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_work_text() {
  cat <<'ITEM'
# Some work

- **State:** Done
- **Tags:** [work]

Some text.
ITEM
}

control_work_name=2026-01-01T00-00-00Z-some-work-DONE.md

mkdir -p "$items_dir"
control_work_text > "$items_dir/$control_work_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Renames a Done item's file Completed ---------------------------------------

completed="$items_dir/2026-01-01T00-00-00Z-some-work-COMPLETED.md"

[ -f "$completed" ] || fail "Renames a Done item's file Completed" "found:" "$(ls "$items_dir")"

# Changes the item's State line to Completed ---------------------------------

state=$(grep '\*\*State:\*\*' "$completed")

[ "$state" = "- **State:** Completed" ] || fail "Changes the item's State line to Completed" "found:" "$state"

echo "0 failed, 0 aborted"
