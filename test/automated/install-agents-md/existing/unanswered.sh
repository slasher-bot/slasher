#!/bin/sh
# Usage:
#
#   test/automated/install-agents-md/existing/unanswered.sh
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
#       Unanswered

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

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" slasher/system/foundation/install.sh agents-md < /dev/null 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$status" != 0 ] || fail "Fails" "output:" "$output"
[ "$agents_md" = "$(control_existing_text)" ] || fail "Leaves AGENTS.md unchanged" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
