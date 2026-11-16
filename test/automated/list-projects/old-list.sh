#!/bin/sh
# Usage:
#
#   test/automated/list-projects/old-list.sh
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

registry=$(mktemp -d)
trap 'rm -rf "$registry"' EXIT

control_project="$registry/some-project"
mkdir -p "$control_project/slasher/system"
git init -q "$control_project"

cat > "$registry/projects.toml" <<REGISTRY
included = [
  "$registry",
]
REGISTRY

# Actuation ------------------------------------------------------------------

output=$(SLASHER_REGISTRY="$registry/projects.toml" system/foundation/list-projects.sh 2>&1) && status=0 || status=$?

# Where the registry holds an included list

[ "$status" -ne 0 ] || fail "Fails" "status: $status"
printf '%s\n' "$output" | grep -q "line 1" || fail "Names the line" "output:" "$output"
printf '%s\n' "$output" | grep -q "\[\[project\]\]" || fail "Names the [[project]] entry" "output:" "$output"

echo "0 failed, 0 aborted"
