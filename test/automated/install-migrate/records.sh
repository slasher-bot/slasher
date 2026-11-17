#!/bin/sh
# Usage:
#
#   test/automated/install-migrate/records.sh
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
#   Migrate

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system" "$project/slasher/local/items"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q
echo "- **State:** Open" > "$project/slasher/local/items/2026-01-01T00-00-00Z-some-idea-OPEN.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

[ -f "$project/slasher/local/items/2026-01-01T00-00-00Z-some-idea.md" ] || fail "Runs the record migrations" "found:" "$(ls "$project/slasher/local/items")"

echo "0 failed, 0 aborted"
