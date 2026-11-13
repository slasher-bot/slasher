#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move-gitignore.sh
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

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT
installer="$(pwd)/system/foundation/install.sh"

mkdir -p "$project/waytide/system/foundation"
cp -R system/foundation/plugin "$project/waytide/system/foundation/"
printf '%s\n' '*.gem' 'waytide/local/journal/' '!waytide/local/journal/**' > "$project/.gitignore"

control_gitignore=$(printf '%s\n' '*.gem' 'slasher/local/journal/' '!slasher/local/journal/**')

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Changes .gitignore's waytide/ lines to slasher/, and leaves the others -----

gitignore=$(cat "$project/.gitignore")

[ "$gitignore" = "$control_gitignore" ] || fail "Changes .gitignore's waytide/ lines to slasher/, and leaves the others" "found:" "$gitignore"

echo "0 failed, 0 aborted"
