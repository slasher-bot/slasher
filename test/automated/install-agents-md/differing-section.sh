#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/differing-section.sh
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
  printf '# Some project\n\n## Slasher\n\nSome older Slasher text.\n\nSome instructions of the project.\n'
}
control_agents_md_text > "$project/AGENTS.md"

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md < /dev/null 2>&1) || true

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "$(control_agents_md_text)" ] || fail "Leaves AGENTS.md unchanged where its Slasher section differs from the bootstrap" "AGENTS.md:" "$agents_md"

case $output in
  *"@slasher/SLASHER.md"*) ;;
  *) fail "Says to replace the section with the line" "output:" "$output" ;;
esac

echo "0 failed, 0 aborted"
