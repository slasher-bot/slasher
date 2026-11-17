#!/bin/sh
# Usage:
#
#   test/automated/local-directory/current-implementation.sh
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
records="$parent/some-records"
mkdir -p "$project/slasher/system/foundation" "$records"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"

registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML
cp system/foundation/current-implementation.sh "$project/slasher/system/foundation/"
mkdir -p "$records/implementations"
cat > "$records/implementations/2026-01-01T00-00-00Z-some-cart.md" <<'RECORD'
# Feature — Some cart

- **State:** Active
- **Implementation branch:** `feature/some-cart`
RECORD

(cd "$project" && git init -q && git add . && git -c user.name=some -c user.email=some@example.com commit -q -m "Some commit" && git branch feature/some-cart)

# Actuation ------------------------------------------------------------------

branch=$(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/current-implementation.sh)

# Where the implementation is recorded in the relocated directory

[ "$branch" = "feature/some-cart" ] || fail "Prints the implementation's branch" "branch: $branch"

echo "0 failed, 0 aborted"
