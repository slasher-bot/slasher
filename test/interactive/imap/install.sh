#!/bin/sh
# The imap package is installed by name into a project.
#
# Usage:
#
#   test/interactive/imap/install.sh
#
# Run from the repository root. The engineer runs it, since it fetches every
# package from its published repository over the network.
set -e

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

# Imap
#   Install

# Controls -------------------------------------------------------------------

repository=$(pwd)

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project"
git -C "$project" init -q

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$repository/install" default imap) > /dev/null

# Observation ----------------------------------------------------------------

[ -x "$project/slasher/system/imap/fetch.py" ] || fail "Installs the imap scripts" "fetch.py:" "$(ls -l "$project/slasher/system/imap" 2>&1)"
[ -f "$project/.claude/skills/slasher/skills/email/SKILL.md" ] || fail "Installs the /email command" "skills:" "$(ls "$project/.claude/skills/slasher/skills" 2>&1)"

echo "0 failed, 0 aborted"
