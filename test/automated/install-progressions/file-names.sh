#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/file-names.sh
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
local_dir="$project/slasher/local"

mkdir -p "$local_dir/logs/log"
log_dir="$local_dir/logs/log"
printf '# The some idea reaches Implementation\n' > "$log_dir/2026-01-01T00-00-00Z-some-idea-reaches-implementation.md"
printf '# The some work item is Implementation\n' > "$log_dir/2026-01-01T00-00-01Z-some-work-item-is-implementation.md"
printf '# The some idea takes Implementation\n' > "$log_dir/2026-01-01T00-00-02Z-some-idea-takes-implementation.md"
printf '# The implementation hinge is reworded\n' > "$log_dir/2026-01-01T00-00-03Z-the-implementation-hinge-is-reworded.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

names=$(ls "$log_dir")

control_names='2026-01-01T00-00-00Z-some-idea-reaches-progression.md
2026-01-01T00-00-01Z-some-work-item-is-progression.md
2026-01-01T00-00-02Z-some-idea-takes-progression.md
2026-01-01T00-00-03Z-the-implementation-hinge-is-reworded.md'

# Renames a log entry that records the Implementation state, and no other

[ "$names" = "$control_names" ] || fail "Renames a log entry that records the Implementation state, and no other" "found:" "$names"

echo "0 failed, 0 aborted"
