#!/bin/sh
# Usage:
#
#   test/automated/install-migrate/no-agents-md.sh
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

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null 2>&1)

# Observation ----------------------------------------------------------------

[ ! -e "$project/AGENTS.md" ] || fail "Creates no AGENTS.md"
[ -z "$output" ] || fail "Prints nothing where nothing changed" "output:" "$output"

echo "0 failed, 0 aborted"
