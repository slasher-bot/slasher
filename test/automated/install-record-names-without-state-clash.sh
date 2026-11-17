#!/bin/sh
# Usage:
#
#   test/automated/install-record-names-without-state-clash.sh
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
items_dir="$project/slasher/local/items"

control_suffixed_name=2026-01-01T00-00-00Z-some-idea-OPEN.md
control_name=2026-01-01T00-00-00Z-some-idea.md

mkdir -p "$items_dir"
echo "Some suffixed text." > "$items_dir/$control_suffixed_name"
echo "Some other text." > "$items_dir/$control_name"

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" sh "$installer" agents-md)

# Leaves the suffixed record in place ----------------------------------------

[ "$(cat "$items_dir/$control_suffixed_name")" = "Some suffixed text." ] || fail "Leaves the suffixed record in place" "found:" "$(ls "$items_dir")"

# Leaves the record already named without a state unchanged ------------------

[ "$(cat "$items_dir/$control_name")" = "Some other text." ] || fail "Leaves the record already named without a state unchanged" "found:" "$(cat "$items_dir/$control_name")"

# Says that both are present -------------------------------------------------

case $output in
  *"Both slasher/local/items/$control_suffixed_name and slasher/local/items/$control_name are present"*) ;;
  *) fail "Says that both are present" "output:" "$output" ;;
esac

echo "0 failed, 0 aborted"
