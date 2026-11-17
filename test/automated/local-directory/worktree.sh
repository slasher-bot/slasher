#!/bin/sh
# Usage:
#
#   test/automated/local-directory/worktree.sh
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
mkdir -p "$parent/some-records"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$parent/some-records"
TOML

(cd "$project" && git init -q && git add . && git -c user.name=some -c user.email=some@example.com commit -q -m "Some commit")
worktree="$parent/some-worktree"
(cd "$project" && git worktree add -q -b some-branch "$worktree")

# Actuation ------------------------------------------------------------------

directory=$(cd "$worktree" && SLASHER_REGISTRY="$registry" slasher/system/foundation/local-directory.sh)

# Run from a worktree of a project whose entry has a local key

[ "$directory" = "$parent/some-records" ] || fail "Prints the project's configured directory" "directory: $directory"

echo "0 failed, 0 aborted"
