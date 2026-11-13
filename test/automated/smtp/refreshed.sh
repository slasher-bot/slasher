#!/bin/sh
# Usage:
#
#   test/automated/smtp/refreshed.sh
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

# Smtp
#   Refreshed

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

export GIT_AUTHOR_NAME="some name" GIT_AUTHOR_EMAIL="some-email" GIT_COMMITTER_NAME="some name" GIT_COMMITTER_EMAIL="some-email"

origin="$directory/origin"
mkdir -p "$origin/smtp.git"
git -C "$origin/smtp.git" init -q -b master
echo "some readme" > "$origin/smtp.git/README.md"
git -C "$origin/smtp.git" add README.md
git -C "$origin/smtp.git" commit -q -m "some commit"

project="$directory/some-project"
mkdir -p "$project/slasher/system"
git -C "$project" init -q -b master
cp -R system/foundation "$project/slasher/system/"
git -C "$project" add -A
git -C "$project" commit -q -m "some commit"
(cd "$project" && git subtree add -q --prefix slasher/system/smtp "$origin/smtp.git" master --squash) > /dev/null 2>&1

echo "some other readme" > "$origin/smtp.git/README.md"
git -C "$origin/smtp.git" commit -q -a -m "some other commit"

control_readme="some other readme"

# Actuation ------------------------------------------------------------------

(cd "$project" && SLASHER_ORIGIN="$origin" slasher/system/foundation/refresh-packages.sh smtp) > /dev/null

# Observation ----------------------------------------------------------------

readme=$(cat "$project/slasher/system/smtp/README.md")

[ "$readme" = "$control_readme" ] || fail "Brings the package's newer files" "README.md:" "$readme"

echo "0 failed, 0 aborted"
