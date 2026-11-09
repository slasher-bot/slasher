#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/system-without-system-project-toml.sh
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

config=$(mktemp -d)
project=$(mktemp -d)
trap 'rm -rf "$config" "$project"' EXIT

mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh "$project/system/foundation/"

# Actuation ------------------------------------------------------------------

system=$(cd "$project" && SLASHER_SYSTEM_PROJECT="$config/system-project.toml" system/foundation/resolve-project.sh -system 2>/dev/null) && status=0 || status=$?

#

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
[ -z "$system" ] || fail "Fails" "output:" "$system"

echo "1 passed"
