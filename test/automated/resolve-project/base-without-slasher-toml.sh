#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/base-without-slasher-toml.sh
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

parent=$(mktemp -d)
trap 'rm -rf "$parent"' EXIT

project="$parent/some-project"
mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh "$project/system/foundation/"

# Actuation ------------------------------------------------------------------

base=$(cd "$project" && system/foundation/resolve-project.sh -base 2>/dev/null) && status=0 || status=$?

# When the parent directory holds no slasher.toml

[ "$status" -ne 0 ] || fail "Fails" "output:" "$base"

echo "0 failed, 0 aborted"
