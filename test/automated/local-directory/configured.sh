#!/bin/sh
# Usage:
#
#   test/automated/local-directory/configured.sh
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
home="$parent/home"
mkdir -p "$home/some-records"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "~/some-records"
TOML

# Actuation ------------------------------------------------------------------

directory=$(cd "$project" && HOME="$home" SLASHER_REGISTRY="$registry" slasher/system/foundation/local-directory.sh)

# Where the project's entry has a local key

[ "$directory" = "$home/some-records" ] || fail "Prints the configured directory, with ~ read as the home directory" "directory: $directory"

echo "0 failed, 0 aborted"
