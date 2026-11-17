#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/existing/appended.sh
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
#     Existing
#       Appended

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q

control_existing_text() {
  printf '# Some project\n\nSome instructions.\n'
}
control_existing_text > "$project/AGENTS.md"

control_agents_md_text=$(control_existing_text; echo; echo "@slasher/SLASHER.md")

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md --append-agents-md < /dev/null)

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "$control_agents_md_text" ] || fail "Appends the line that imports slasher/SLASHER.md after the existing text" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
