#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/slasher-home-without-slasher-home-toml.sh
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

slasher_home=$(cd "$project" && SLASHER_HOME_PROJECT="$config/slasher-home.toml" system/foundation/resolve-project.sh -slasher-home 2>/dev/null) && status=0 || status=$?

# When slasher-home.toml is missing

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
[ -z "$slasher_home" ] || fail "Fails" "output:" "$slasher_home"

echo "0 failed, 0 aborted"
