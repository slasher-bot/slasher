#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/item-state.sh
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
local_dir="$project/slasher/local"

mkdir -p "$local_dir/items"
control_item="$local_dir/items/2026-01-01T00-00-00Z-some-idea.md"
printf '# Some idea\n\n**State:** Implementation\n\n**Tags:** [idea]\n' > "$control_item"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Changes an item's Implementation state line to Progression

state=$(grep '\*\*State:\*\*' "$control_item")

[ "$state" = "**State:** Progression" ] || fail "Changes an item's Implementation state line to Progression" "found:" "$state"

echo "0 failed, 0 aborted"
