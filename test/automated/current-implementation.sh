#!/bin/sh
# Usage:
#
#   test/automated/current-implementation.sh
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
trap 'rm -rf "$project"' EXIT
mkdir -p "$project/system/foundation" "$project/local/implementations"
cp system/foundation/current-implementation.sh "$project/system/foundation/"

control_branch="feature/some-subject"

cat > "$project/local/implementations/2026-01-01T00-00-00Z-some-subject-ACTIVE.md" <<RECORD
# Feature — Some intent

- **State:** Active
- **Implementation branch:** \`$control_branch\`
RECORD

# Actuation ------------------------------------------------------------------

implementation=$(cd "$project" && system/foundation/current-implementation.sh)

# Prints the current implementation's branch --------------------------------

[ "$implementation" = "$control_branch" ] || fail "Prints the current implementation's branch" "found:" "$implementation"

# Prints the current implementation's branch in an installed project --------

installed=$(mktemp -d)
trap 'rm -rf "$project" "$installed"' EXIT
mkdir -p "$installed/slasher/system/foundation" "$installed/slasher/local/implementations"
cp system/foundation/current-implementation.sh "$installed/slasher/system/foundation/"

cat > "$installed/slasher/local/implementations/2026-01-01T00-00-00Z-some-subject-ACTIVE.md" <<RECORD
# Feature — Some intent

- **State:** Active
- **Implementation branch:** \`$control_branch\`
RECORD

installed_implementation=$(cd "$installed" && slasher/system/foundation/current-implementation.sh)

[ "$installed_implementation" = "$control_branch" ] || fail "Prints the current implementation's branch in an installed project" "found:" "$installed_implementation"

# Prints the branch of the implementation most recently acted upon ----------

several=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several"' EXIT
mkdir -p "$several/system/foundation" "$several/local/implementations"
cp system/foundation/current-implementation.sh "$several/system/foundation/"

# The receipt record is the older of the two, and its branch has the later commit.
cat > "$several/local/implementations/2026-01-01T00-00-00Z-some-receipt-ACTIVE.md" <<'RECORD'
# Feature — Some receipt

- **State:** Active
- **Implementation branch:** `feature/receipt`
RECORD

cat > "$several/local/implementations/2026-01-02T00-00-00Z-some-cart-ACTIVE.md" <<'RECORD'
# Feature — Some cart

- **State:** Active
- **Implementation branch:** `feature/cart`
RECORD

commit() {
  GIT_AUTHOR_DATE="$2" GIT_COMMITTER_DATE="$2" git -C "$1" -c user.name="some name" -c user.email="some-email" commit -q --allow-empty -m "some commit"
}

git -C "$several" init -q -b master
commit "$several" "2026-01-01T00:00:00Z"
git -C "$several" switch -q -c feature/receipt
commit "$several" "2026-01-04T00:00:00Z"
git -C "$several" switch -q -c feature/cart master
commit "$several" "2026-01-03T00:00:00Z"
git -C "$several" switch -q master

control_recent_branch="feature/receipt"

several_implementation=$(cd "$several" && system/foundation/current-implementation.sh)

[ "$several_implementation" = "$control_recent_branch" ] || fail "Prints the branch of the implementation most recently acted upon" "found:" "$several_implementation"

# Prints the branch of the phase under way ----------------------------------

phased=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several" "$phased"' EXIT
mkdir -p "$phased/system/foundation" "$phased/local/implementations"
cp system/foundation/current-implementation.sh "$phased/system/foundation/"

cat > "$phased/local/implementations/2026-01-01T00-00-00Z-some-receipt-ACTIVE.md" <<'RECORD'
# Feature — Some receipt

- **State:** Active
- **Implementation branch:** `feature/receipt`
RECORD

git -C "$phased" init -q -b master
commit "$phased" "2026-01-01T00:00:00Z"
git -C "$phased" switch -q -c feature/receipt
commit "$phased" "2026-01-02T00:00:00Z"
git -C "$phased" switch -q -c feature/receipt.tax-line
commit "$phased" "2026-01-03T00:00:00Z"
git -C "$phased" switch -q master

control_phase_branch="feature/receipt.tax-line"

phased_implementation=$(cd "$phased" && system/foundation/current-implementation.sh)

[ "$phased_implementation" = "$control_phase_branch" ] || fail "Prints the branch of the phase under way" "found:" "$phased_implementation"

# Prints the branch of an Open implementation -------------------------------

opened=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several" "$phased" "$opened"' EXIT
mkdir -p "$opened/system/foundation" "$opened/local/implementations"
cp system/foundation/current-implementation.sh "$opened/system/foundation/"

control_open_branch="feature/some-cart"

cat > "$opened/local/implementations/2026-01-01T00-00-00Z-some-cart-OPEN.md" <<RECORD
# Feature — Some cart

- **State:** Open
- **Implementation branch:** \`$control_open_branch\`
RECORD

opened_implementation=$(cd "$opened" && system/foundation/current-implementation.sh)

[ "$opened_implementation" = "$control_open_branch" ] || fail "Prints the branch of an Open implementation" "found:" "$opened_implementation"

echo "0 failed, 0 aborted"
