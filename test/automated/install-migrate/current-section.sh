#!/bin/sh
# Usage:
#
#   test/automated/install-migrate/current-section.sh
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
control_existing_text() {
  printf '# Some project\n\nSome instructions.\n'
}
{ control_existing_text; echo; system/foundation/install.sh bootstrap; } > "$project/AGENTS.md"

control_agents_md_text=$(control_existing_text; echo; echo "@slasher/SLASHER.md")

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "$control_agents_md_text" ] || fail "Replaces a Slasher section that is exactly the current bootstrap with the import line" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
