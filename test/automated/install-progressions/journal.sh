#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/journal.sh
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

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT
installer="$(pwd)/system/foundation/install.sh"
local_dir="$project/slasher/local"

mkdir -p "$local_dir/journal/some-writer" "$local_dir/implementations"
control_entry="$local_dir/journal/some-writer/2026-01-01-some-entry.md"
control_text='Features and experiments are a single record type under implementations/.'
printf '%s\n' "$control_text" > "$control_entry"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Leaves a journal entry as written

[ "$(cat "$control_entry")" = "$control_text" ] || fail "Leaves a journal entry as written" "found:" "$(cat "$control_entry")"

echo "0 failed, 0 aborted"
