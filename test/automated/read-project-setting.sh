#!/bin/sh
# Usage:
#
#   test/automated/read-project-setting.sh
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
cat > "$registry" <<TOML
[[project]]
path = "$parent/some-other-project"
journal = "some-other-value"

[[project]]
path = "$project"
journal = "private"
TOML

# Actuation ------------------------------------------------------------------

journal=$(cd "$project" && SLASHER_REGISTRY="$registry" system/foundation/read-project-setting.sh journal)

[ "$journal" = "private" ] || fail "Prints the value" "journal: $journal"

echo "0 failed, 0 aborted"
