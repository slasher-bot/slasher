#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/record-text.sh
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

mkdir -p "$local_dir/implementations" "$local_dir/items" "$local_dir/logs/loops"
control_record="$local_dir/implementations/2026-01-01T00-00-00Z-some-feature.md"
cat > "$control_record" <<'RECORD'
# Feature — Some feature

- **State:** Active
- **Implementation branch:** `feature/some-feature`

The implementation record names `slasher/local/implementations/2026-01-01T00-00-00Z-some-feature.md`.
Implementation records are kept. An implementation record is one file. The implementation hinge passes.
RECORD
control_loop="$local_dir/logs/loops/2026-01-01T00-00-00Z-some-feature.md"
printf 'The Implementation record is in implementations/.\n' > "$control_loop"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

record="$local_dir/progressions/2026-01-01T00-00-00Z-some-feature.md"

# Changes the Implementation branch line to Progression branch

grep -qx -- '- \*\*Progression branch:\*\* `feature/some-feature`' "$record" || fail "Changes the Implementation branch line to Progression branch" "found:" "$(cat "$record")"

# Changes implementation record, and its paths, to progression record

grep -qx 'The progression record names `slasher/local/progressions/2026-01-01T00-00-00Z-some-feature.md`.' "$record" || fail "Changes implementation record, and its paths, to progression record" "found:" "$(cat "$record")"

grep -q '^Progression records are kept\.' "$record" || fail "Changes implementation record, and its paths, to progression record" "found:" "$(cat "$record")"

grep -qx 'The Progression record is in progressions/.' "$control_loop" || fail "Changes implementation record, and its paths, to progression record" "found:" "$(cat "$control_loop")"

grep -q 'A progression record is one file\.' "$record" || fail "Changes implementation record, and its paths, to progression record" "found:" "$(cat "$record")"

# Leaves implementation in its other sense

grep -q 'The implementation hinge passes\.' "$record" || fail "Leaves implementation in its other sense" "found:" "$(cat "$record")"

echo "0 failed, 0 aborted"
