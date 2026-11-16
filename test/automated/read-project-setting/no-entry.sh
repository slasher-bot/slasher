#!/bin/sh
# Usage:
#
#   test/automated/read-project-setting/no-entry.sh
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

registry="$parent/index.toml"
cat > "$registry" <<TOML
[[project]]
path = "$parent/some-other-project"
journal = "private"
TOML

# Actuation ------------------------------------------------------------------

journal=$(cd "$project" && SLASHER_REGISTRY="$registry" system/foundation/read-project-setting.sh journal)

# Where the project has no entry in the registry

[ -z "$journal" ] || fail "Prints nothing" "journal: $journal"

echo "0 failed, 0 aborted"
