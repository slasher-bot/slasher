#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/slasher-md.sh
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
#   AGENTS.md

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q

control_slasher_md_text=$(system/foundation/install.sh bootstrap)

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

slasher_md=$(cat "$project/slasher/SLASHER.md" 2>/dev/null || true)

[ "$slasher_md" = "$control_slasher_md_text" ] || fail "Writes the bootstrap to slasher/SLASHER.md" "slasher/SLASHER.md:" "$slasher_md"

echo "0 failed, 0 aborted"
