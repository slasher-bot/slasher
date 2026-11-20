#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/slasher-home.sh
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

control_slasher_home="$config/some-slasher-home"

cat > "$config/slasher-home.toml" <<CONFIG
path = "$control_slasher_home"
CONFIG

# Actuation ------------------------------------------------------------------

slasher_home=$(cd "$project" && SLASHER_HOME_PROJECT="$config/slasher-home.toml" system/foundation/resolve-project.sh -slasher-home)

echo "Slasher home: $slasher_home"

# Prints the Slasher home directory slasher-home.toml names

[ "$slasher_home" = "$control_slasher_home" ] || fail "Prints the Slasher home directory slasher-home.toml names" "found:" "$slasher_home"

echo "0 failed, 0 aborted"
