#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/workspace-without-slasher-toml.sh
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

workspace=$(cd "$project" && system/foundation/resolve-project.sh -workspace 2>/dev/null) && status=0 || status=$?

# When the parent directory holds no slasher.toml

[ "$status" -ne 0 ] || fail "Fails" "output:" "$workspace"

echo "0 failed, 0 aborted"
