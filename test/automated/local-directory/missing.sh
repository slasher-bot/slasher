#!/bin/sh
# Usage:
#
#   test/automated/local-directory/missing.sh
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
parent=$(cd "$parent" && pwd -P)

project="$parent/some-project"
mkdir -p "$project/slasher/system/foundation" "$project/slasher/local"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"
registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$parent/some-absent-records"
TOML

# Actuation ------------------------------------------------------------------

status=0
output=$(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/local-directory.sh 2>&1) || status=$?

# Where the configured directory does not exist

[ "$status" -ne 0 ] || fail "Fails" "output: $output"

case $output in
  *"$parent/some-absent-records"*) ;;
  *) fail "Names the configured directory" "output: $output" ;;
esac

echo "0 failed, 0 aborted"
