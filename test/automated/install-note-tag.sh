#!/bin/sh
# Usage:
#
#   test/automated/install-note-tag.sh
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
control_note_text() {
  cat <<'ITEM'
# Some observation

- **State:** Recorded
- **Tags:** [observation] [design]

Some text.
ITEM
}

control_note_name=2026-01-01T00-00-00Z-some-observation-RECORDED.md

mkdir -p "$items_dir"
control_note_text > "$items_dir/$control_note_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Retags an observation as a note -------------------------------------------

tags=$(grep '\*\*Tags:\*\*' "$items_dir/$control_note_name")

[ "$tags" = "- **Tags:** [note] [design]" ] || fail "Retags an observation as a note" "found:" "$tags"

echo "0 failed, 0 aborted"
