#!/bin/sh
# Usage:
#
#   test/automated/install-record-names-without-state.sh
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
implementations_dir="$project/slasher/local/implementations"

# The text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_item_text() {
  cat <<'ITEM'
# Some idea

- **State:** Open
- **Tags:** [idea]

Some text.
ITEM
}

control_implementation_text() {
  cat <<'RECORD'
# Feature — Some feature

**Tags:** [feature]

- **State:** Active
RECORD
}

mkdir -p "$items_dir" "$implementations_dir"
control_item_text > "$items_dir/2026-01-01T00-00-00Z-some-idea-OPEN.md"
control_implementation_text > "$implementations_dir/2026-01-01T00-00-00Z-some-feature-ACTIVE.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Removes the state from an item's file name ---------------------------------

item="$items_dir/2026-01-01T00-00-00Z-some-idea.md"

[ -f "$item" ] || fail "Removes the state from an item's file name" "found:" "$(ls "$items_dir")"

# Leaves the item's content unchanged ----------------------------------------

[ "$(cat "$item")" = "$(control_item_text)" ] || fail "Leaves the item's content unchanged" "found:" "$(cat "$item")"

# Removes the state from an implementation record's file name ----------------

implementation="$implementations_dir/2026-01-01T00-00-00Z-some-feature.md"

[ -f "$implementation" ] || fail "Removes the state from an implementation record's file name" "found:" "$(ls "$implementations_dir")"

# Leaves the implementation record's content unchanged -----------------------

[ "$(cat "$implementation")" = "$(control_implementation_text)" ] || fail "Leaves the implementation record's content unchanged" "found:" "$(cat "$implementation")"

echo "0 failed, 0 aborted"
