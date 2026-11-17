#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/has-line.sh
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

control_agents_md_text() {
  printf '# Some project\n\nSome instructions.\n\n@slasher/SLASHER.md\n'
}
control_agents_md_text > "$project/AGENTS.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "$(control_agents_md_text)" ] || fail "Leaves AGENTS.md unchanged where it has the line" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
