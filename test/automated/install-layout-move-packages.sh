#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move-packages.sh
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

origin=$(mktemp -d)
project=$(mktemp -d)
home=$(mktemp -d)
control_package=$(mktemp -d)
trap 'rm -rf "$origin" "$project" "$home" "$control_package"' EXIT
installer="$(pwd)/system/foundation/install.sh"

control_repository() {
  git init -q --bare "$origin/$1.git"
  work=$(mktemp -d)
  cp -R "$2"/. "$work"
  git -C "$work" init -q
  git -C "$work" add -A
  git -C "$work" commit -qm "Some $1"
  git -C "$work" push -q "$origin/$1.git" HEAD:master
  rm -rf "$work"
}

echo "# Some Package" > "$control_package/README.md"
control_repository foundation system/foundation
control_repository some-package "$control_package"

git -C "$project" init -q
git -C "$project" commit -q --allow-empty -m "Some project"
(cd "$project" &&
  git subtree add -q --prefix waytide/system/foundation "$origin/foundation.git" master --squash &&
  git subtree add -q --prefix waytide/system/some-package "$origin/some-package.git" master --squash) > /dev/null 2>&1

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" SLASHER_ORIGIN="$origin" sh "$installer") > /dev/null 2>&1 || true

# Re-adds each package under slasher/system/ ---------------------------------

pulled=no
(cd "$project" && git subtree pull -q --prefix slasher/system/some-package "$origin/some-package.git" master --squash) > /dev/null 2>&1 && pulled=yes

[ "$pulled" = yes ] || fail "Re-adds each package under slasher/system/" "the pull under slasher/system/some-package failed"

echo "0 failed, 0 aborted"
