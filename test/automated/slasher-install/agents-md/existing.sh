#!/bin/sh
# Usage:
#
#   test/automated/slasher-install/agents-md/existing.sh
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

# Slasher install
#   AGENTS.md
#     Existing

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT
home="$directory/home"
mkdir "$home"
installer="$(pwd)/slasher-install"

origin="$directory/origin"
mkdir -p "$origin/foundation.git"
cp -R system/foundation/. "$origin/foundation.git/"
git -C "$origin/foundation.git" init -q -b master
git -C "$origin/foundation.git" add -A
git -C "$origin/foundation.git" commit -q -m "some commit"

project="$directory/some-project"
mkdir "$project"
git -C "$project" init -q

control_existing_text() {
  printf '# Some project\n\nSome instructions.\n'
}
control_existing_text > "$project/AGENTS.md"
git -C "$project" add AGENTS.md
git -C "$project" commit -q -m "some commit"

control_agents_md_text=$(control_existing_text; echo; echo "@slasher/SLASHER.md")

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" SLASHER_ORIGIN="$origin" sh "$installer" foundation --append-agents-md < /dev/null 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

agents_md=$(cat "$project/AGENTS.md")

[ "$agents_md" = "$control_agents_md_text" ] || fail "Passes the answer on to the installer" "output:" "$output" "AGENTS.md:" "$agents_md"

echo "0 failed, 0 aborted"
