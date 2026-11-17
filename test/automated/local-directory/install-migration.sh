#!/bin/sh
# Usage:
#
#   test/automated/local-directory/install-migration.sh
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
home="$parent/home"
installer="$(pwd)/system/foundation/install.sh"
mkdir -p "$project/slasher/system/foundation" "$records/items" "$home"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"
(cd "$project" && git init -q)

registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML

echo "- **State:** Open" > "$records/items/2026-01-01T00-00-00Z-some-idea-OPEN.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" SLASHER_REGISTRY="$registry" sh "$installer" agents-md) > /dev/null

# Where the project's local directory is relocated

[ -f "$records/items/2026-01-01T00-00-00Z-some-idea.md" ] || fail "Renames the records in the relocated directory" "found:" "$(ls "$records/items")"

echo "0 failed, 0 aborted"
