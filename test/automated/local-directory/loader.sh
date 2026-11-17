#!/bin/sh
# Usage:
#
#   test/automated/local-directory/loader.sh
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
cp system/foundation/load-rules.sh "$project/slasher/system/foundation/"
echo some-foundation-rules > "$project/slasher/system/foundation/rules-pre-loaded.md"
mkdir -p "$records/rules" "$records/journal/some-writer"
echo some-local-rule > "$records/rules/some-rule.md"
echo some-local-vocabulary > "$records/vocabulary.md"
echo some-entry > "$records/journal/some-writer/2026-01-01T00-00-some-entry.md"

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/load-rules.sh)

# Where the project's local directory is relocated

case $output in *some-local-rule*) ;; *) fail "Prints the local rules from the relocated directory" "output:" "$output" ;; esac
case $output in *some-local-vocabulary*) ;; *) fail "Prints the vocabulary from the relocated directory" "output:" "$output" ;; esac
case $output in *some-entry*) ;; *) fail "Prints the journal from the relocated directory" "output:" "$output" ;; esac

echo "0 failed, 0 aborted"
