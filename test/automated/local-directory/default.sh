#!/bin/sh
# Usage:
#
#   test/automated/local-directory/default.sh
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
TOML

# Actuation ------------------------------------------------------------------

directory=$(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/local-directory.sh)

# Where the project's entry has no local key

[ "$directory" = "slasher/local" ] || fail "Prints slasher/local" "directory: $directory"

echo "0 failed, 0 aborted"
