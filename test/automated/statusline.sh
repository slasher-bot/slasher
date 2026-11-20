#!/bin/sh
# Usage:
#
#   test/automated/statusline.sh
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
trap 'rm -rf "$project" "$idle"' EXIT
mkdir -p "$project/system/foundation" "$project/local/progressions"
cp system/foundation/statusline.sh system/foundation/current-progression.sh "$project/system/foundation/"

cat > "$project/local/progressions/2026-01-01T00-00-00Z-some-subject.md" <<'RECORD'
# Feature — Some intent

- **State:** Active
- **Progression branch:** `feature/some-subject`
RECORD

# Actuation ------------------------------------------------------------------

status_line=$(cd "$project" && system/foundation/statusline.sh < /dev/null)

# Prints the current progression on a second line ------------------------

second_line=$(printf '%s\n' "$status_line" | sed -n 2p)
control_progression=$(cd "$project" && system/foundation/current-progression.sh)

[ "$second_line" = "$control_progression" ] || fail "Prints the current progression on a second line" "found:" "$status_line"

# Prints no second line where no progression is current ------------------

idle=$(mktemp -d)
mkdir -p "$idle/system/foundation" "$idle/local/progressions"
cp system/foundation/statusline.sh system/foundation/current-progression.sh "$idle/system/foundation/"

cat > "$idle/local/progressions/2026-01-01T00-00-00Z-some-subject.md" <<'RECORD'
# Feature — Some intent

- **State:** Completed
- **Progression branch:** `feature/some-subject`
RECORD

idle_status_line=$(cd "$idle" && system/foundation/statusline.sh < /dev/null)

line_count=$(printf '%s\n' "$idle_status_line" | wc -l | tr -d ' ')

[ "$line_count" = 1 ] || fail "Prints no second line where no progression is current" "found:" "$idle_status_line"

echo "0 failed, 0 aborted"
