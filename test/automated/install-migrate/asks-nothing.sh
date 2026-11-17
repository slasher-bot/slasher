#!/bin/sh
# Usage:
#
#   test/automated/install-migrate/asks-nothing.sh
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
control_agents_md_text() {
  printf '# Some project\n\nSome instructions.\n'
}
control_agents_md_text > "$project/AGENTS.md"

# Actuation ------------------------------------------------------------------

status=0
output=$(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null 2>&1) || status=$?

# Observation ----------------------------------------------------------------

[ "$status" = 0 ] || fail "Succeeds" "output:" "$output"
[ "$(cat "$project/AGENTS.md")" = "$(control_agents_md_text)" ] || fail "Leaves an AGENTS.md with no Slasher section unchanged" "AGENTS.md:" "$(cat "$project/AGENTS.md")"
[ ! -e "$project/CLAUDE.md" ] || fail "Creates no CLAUDE.md"
[ ! -e "$project/.claude/settings.json" ] || fail "Creates no settings file"

echo "0 failed, 0 aborted"
