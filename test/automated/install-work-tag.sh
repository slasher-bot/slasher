#!/bin/sh
# Usage:
#
#   test/automated/install-work-tag.sh
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

- **State:** Active
- **Tags:** [work-item] [records]

Some text.
ITEM
}

control_work_name=2026-01-01T00-00-00Z-some-work.md

mkdir -p "$items_dir"
control_work_text > "$items_dir/$control_work_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Retags a work item [work] --------------------------------------------------

tags=$(grep '\*\*Tags:\*\*' "$items_dir/$control_work_name")

[ "$tags" = "- **Tags:** [work] [records]" ] || fail "Retags a work item [work]" "found:" "$tags"

echo "0 failed, 0 aborted"
