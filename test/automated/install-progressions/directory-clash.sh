#!/bin/sh
# Usage:
#
#   test/automated/install-progressions/directory-clash.sh
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

mkdir -p "$local_dir/implementations" "$local_dir/progressions"
printf '# Feature — Some feature\n' > "$local_dir/implementations/2026-01-01T00-00-00Z-some-feature.md"
printf '# Feature — Some other feature\n' > "$local_dir/progressions/2026-01-01T00-00-01Z-some-other-feature.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# When both implementations/ and progressions/ are present: Touches neither

[ -f "$local_dir/implementations/2026-01-01T00-00-00Z-some-feature.md" ] || fail "When both implementations/ and progressions/ are present: Touches neither" "implementations/ was changed"

[ "$(ls "$local_dir/progressions")" = "2026-01-01T00-00-01Z-some-other-feature.md" ] || fail "When both implementations/ and progressions/ are present: Touches neither" "progressions/ was changed" "$(ls "$local_dir/progressions")"

echo "0 failed, 0 aborted"
