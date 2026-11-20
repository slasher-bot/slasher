#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/directory.sh
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

control_record=2026-01-01T00-00-00Z-some-feature.md
mkdir -p "$local_dir/implementations"
printf '# Feature — Some feature\n' > "$local_dir/implementations/$control_record"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Moves implementations/ to progressions/

[ -f "$local_dir/progressions/2026-01-01T00-00-00Z-some-feature.md" ] || fail "Moves implementations/ to progressions/" "found:" "$(ls "$local_dir")"

[ ! -e "$local_dir/implementations" ] || fail "Moves implementations/ to progressions/" "implementations/ is still present"

echo "0 failed, 0 aborted"
