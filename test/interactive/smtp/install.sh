#!/bin/sh
# The smtp package is installed by name into a project, with imap.
#
# Usage:
#
#   test/interactive/smtp/install.sh
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

# Smtp
#   Install

# Controls -------------------------------------------------------------------

repository=$(pwd)

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project"
git -C "$project" init -q

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$repository/slasher-install" default imap smtp) > /dev/null

# Observation ----------------------------------------------------------------

[ -x "$project/slasher/system/smtp/send.py" ] || fail "Installs the smtp script" "send.py:" "$(ls -l "$project/slasher/system/smtp" 2>&1)"
[ -x "$project/slasher/system/imap/credential.sh" ] || fail "Installs the imap credential script it reads with" "credential.sh:" "$(ls -l "$project/slasher/system/imap" 2>&1)"
[ -f "$project/.claude/skills/slasher/skills/smtp/SKILL.md" ] || fail "Installs the /smtp command" "skills:" "$(ls "$project/.claude/skills/slasher/skills" 2>&1)"

echo "0 failed, 0 aborted"
