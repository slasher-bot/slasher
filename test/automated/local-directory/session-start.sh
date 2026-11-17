#!/bin/sh
# Usage:
#
#   test/automated/local-directory/session-start.sh
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
cp system/foundation/session-start.sh "$project/slasher/system/foundation/"
echo some-foundation-rules > "$project/slasher/system/foundation/rules-pre-loaded.md"
echo "# Slasher — foundation" > "$project/slasher/system/foundation/README.md"

# Actuation ------------------------------------------------------------------

instruction=$(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/session-start.sh instruction)

# Where the project's local directory is relocated

case $instruction in *"$records/rules/"*) ;; *) fail "Names the relocated local rules" "instruction:" "$instruction" ;; esac
case $instruction in *"$records/vocabulary.md"*) ;; *) fail "Names the relocated vocabulary" "instruction:" "$instruction" ;; esac

echo "0 failed, 0 aborted"
