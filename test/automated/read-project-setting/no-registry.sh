#!/bin/sh
# Usage:
#
#   test/automated/read-project-setting/no-registry.sh
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
cp system/foundation/read-project-setting.sh "$project/system/foundation/"

registry="$parent/consuming-projects.toml"

# Actuation ------------------------------------------------------------------

journal=$(cd "$project" && SLASHER_REGISTRY="$registry" system/foundation/read-project-setting.sh journal 2>&1) && status=0 || status=$?

# Where no registry file exists

[ "$status" -eq 0 ] || fail "Succeeds" "status: $status" "output: $journal"
[ -z "$journal" ] || fail "Prints nothing" "output: $journal"

echo "0 failed, 0 aborted"
