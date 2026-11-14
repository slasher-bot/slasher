#!/bin/sh
# Usage:
#
#   test/automated/install-note-state.sh
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
control_observation_text() {
  cat <<'ITEM'
# Some observation

- **State:** Open
- **Tags:** [observation]

Some text.
ITEM
}

control_observation_name=2026-01-01T00-00-00Z-some-observation-OPEN.md

mkdir -p "$items_dir"
control_observation_text > "$items_dir/$control_observation_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Renames an Open note's file Recorded ---------------------------------------

recorded="$items_dir/2026-01-01T00-00-00Z-some-observation-RECORDED.md"

[ -f "$recorded" ] || fail "Renames an Open note's file Recorded" "found:" "$(ls "$items_dir")"

# Changes the note's State line to Recorded ----------------------------------

state=$(grep '\*\*State:\*\*' "$recorded")

[ "$state" = "- **State:** Recorded" ] || fail "Changes the note's State line to Recorded" "found:" "$state"

echo "0 failed, 0 aborted"
