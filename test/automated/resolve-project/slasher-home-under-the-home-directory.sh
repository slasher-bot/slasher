#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/slasher-home-under-the-home-directory.sh
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
control_home=$(mktemp -d)
trap 'rm -rf "$config" "$project" "$control_home"' EXIT

mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh "$project/system/foundation/"

control_slasher_home="$control_home/some-slasher-home"

cat > "$config/slasher-home.toml" <<CONFIG
path = "~/some-slasher-home"
CONFIG

# Actuation ------------------------------------------------------------------

slasher_home=$(cd "$project" && HOME="$control_home" SLASHER_HOME_PROJECT="$config/slasher-home.toml" system/foundation/resolve-project.sh -slasher-home)

echo "Slasher home: $slasher_home"

# Prints the Slasher home directory, with a leading ~ read as the home directory

[ "$slasher_home" = "$control_slasher_home" ] || fail "Prints the Slasher home directory, with a leading ~ read as the home directory" "found:" "$slasher_home"

echo "0 failed, 0 aborted"
