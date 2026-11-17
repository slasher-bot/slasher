#!/bin/sh
# Usage:
#
#   test/automated/refresh-packages/migrations.sh
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

# Refresh packages

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

export GIT_AUTHOR_NAME="some name" GIT_AUTHOR_EMAIL="some-email" GIT_COMMITTER_NAME="some name" GIT_COMMITTER_EMAIL="some-email"

origin="$directory/origin"
mkdir -p "$origin/sample.git"
git -C "$origin/sample.git" init -q -b master
echo "some readme" > "$origin/sample.git/README.md"
git -C "$origin/sample.git" add README.md
git -C "$origin/sample.git" commit -q -m "some commit"

project="$directory/some-project"
mkdir -p "$project/slasher/system"
git -C "$project" init -q -b master
cp -R system/foundation "$project/slasher/system/"
echo "@slasher/SLASHER.md" > "$project/AGENTS.md"
mkdir -p "$project/slasher/local/items"
echo "- **State:** Open" > "$project/slasher/local/items/2026-01-01T00-00-00Z-some-idea-OPEN.md"
git -C "$project" add -A
git -C "$project" commit -q -m "some commit"
(cd "$project" && git subtree add -q --prefix slasher/system/sample "$origin/sample.git" master --squash) > /dev/null 2>&1

# Actuation ------------------------------------------------------------------

(cd "$project" && SLASHER_ORIGIN="$origin" slasher/system/foundation/refresh-packages.sh sample) > /dev/null

# Observation ----------------------------------------------------------------

[ -f "$project/slasher/local/items/2026-01-01T00-00-00Z-some-idea.md" ] || fail "Runs the pulled installer's migrations after the pull" "found:" "$(ls "$project/slasher/local/items")"

echo "0 failed, 0 aborted"
