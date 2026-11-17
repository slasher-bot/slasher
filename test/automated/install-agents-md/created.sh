#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/created.sh
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

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "@slasher/SLASHER.md" ] || fail "Creates AGENTS.md holding the line that imports slasher/SLASHER.md" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
