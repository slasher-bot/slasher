#!/bin/sh
# Usage:
#
#   test/automated/slasher-install/list.sh
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

repository=$(pwd)

project=$(mktemp -d)
trap 'rm -rf "$project"' EXIT

control_listing_text() {
  cat <<'LISTING'
default: foundation language testing git versioning design-by-efferent journal
content: foundation language git versioning journal
other: imap smtp ext/ruby-lang
LISTING
}

# Actuation ------------------------------------------------------------------

listing=$(cd "$project" && sh "$repository/slasher-install" --list)

# Lists each set's packages, then the packages outside every set -------------

[ "$listing" = "$(control_listing_text)" ] || fail "Lists each set's packages, then the packages outside every set" "found:" "$listing"

echo "0 failed, 0 aborted"
