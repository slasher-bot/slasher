#!/bin/sh
# Usage:
#
#   test/automated/current-progression.sh
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
mkdir -p "$project/system/foundation" "$project/local/progressions"
cp system/foundation/current-progression.sh "$project/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/system/foundation/"

control_branch="feature/some-subject"

cat > "$project/local/progressions/2026-01-01T00-00-00Z-some-subject.md" <<RECORD
# Feature — Some intent

- **State:** Active
- **Progression branch:** \`$control_branch\`
RECORD

# Actuation ------------------------------------------------------------------

progression=$(cd "$project" && system/foundation/current-progression.sh)

# Prints the current progression's branch --------------------------------

[ "$progression" = "$control_branch" ] || fail "Prints the current progression's branch" "found:" "$progression"

# Prints the current progression's branch in an installed project --------

installed=$(mktemp -d)
trap 'rm -rf "$project" "$installed"' EXIT
mkdir -p "$installed/slasher/system/foundation" "$installed/slasher/local/progressions"
cp system/foundation/current-progression.sh "$installed/slasher/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$installed/slasher/system/foundation/"

cat > "$installed/slasher/local/progressions/2026-01-01T00-00-00Z-some-subject.md" <<RECORD
# Feature — Some intent

- **State:** Active
- **Progression branch:** \`$control_branch\`
RECORD

installed_progression=$(cd "$installed" && slasher/system/foundation/current-progression.sh)

[ "$installed_progression" = "$control_branch" ] || fail "Prints the current progression's branch in an installed project" "found:" "$installed_progression"

# Prints the branch of the progression most recently acted upon ----------

several=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several"' EXIT
mkdir -p "$several/system/foundation" "$several/local/progressions"
cp system/foundation/current-progression.sh "$several/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$several/system/foundation/"

# The receipt record is the older of the two, and its branch has the later commit.
cat > "$several/local/progressions/2026-01-01T00-00-00Z-some-receipt.md" <<'RECORD'
# Feature — Some receipt

- **State:** Active
- **Progression branch:** `feature/receipt`
RECORD

cat > "$several/local/progressions/2026-01-02T00-00-00Z-some-cart.md" <<'RECORD'
# Feature — Some cart

- **State:** Active
- **Progression branch:** `feature/cart`
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

several_progression=$(cd "$several" && system/foundation/current-progression.sh)

[ "$several_progression" = "$control_recent_branch" ] || fail "Prints the branch of the progression most recently acted upon" "found:" "$several_progression"

# Prints the branch of the phase under way ----------------------------------

phased=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several" "$phased"' EXIT
mkdir -p "$phased/system/foundation" "$phased/local/progressions"
cp system/foundation/current-progression.sh "$phased/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$phased/system/foundation/"

cat > "$phased/local/progressions/2026-01-01T00-00-00Z-some-receipt.md" <<'RECORD'
# Feature — Some receipt

- **State:** Active
- **Progression branch:** `feature/receipt`
RECORD

git -C "$phased" init -q -b master
commit "$phased" "2026-01-01T00:00:00Z"
git -C "$phased" switch -q -c feature/receipt
commit "$phased" "2026-01-02T00:00:00Z"
git -C "$phased" switch -q -c feature/receipt.tax-line
commit "$phased" "2026-01-03T00:00:00Z"
git -C "$phased" switch -q master

control_phase_branch="feature/receipt.tax-line"

phased_progression=$(cd "$phased" && system/foundation/current-progression.sh)

[ "$phased_progression" = "$control_phase_branch" ] || fail "Prints the branch of the phase under way" "found:" "$phased_progression"

# Prints the branch of an Open progression -------------------------------

opened=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several" "$phased" "$opened"' EXIT
mkdir -p "$opened/system/foundation" "$opened/local/progressions"
cp system/foundation/current-progression.sh "$opened/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$opened/system/foundation/"

control_open_branch="feature/some-cart"

cat > "$opened/local/progressions/2026-01-01T00-00-00Z-some-cart.md" <<RECORD
# Feature — Some cart

- **State:** Open
- **Progression branch:** \`$control_open_branch\`
RECORD

opened_progression=$(cd "$opened" && system/foundation/current-progression.sh)

[ "$opened_progression" = "$control_open_branch" ] || fail "Prints the branch of an Open progression" "found:" "$opened_progression"

# Prints the branch of an progression recorded only in another worktree ---

worktreed=$(mktemp -d)
trap 'rm -rf "$project" "$installed" "$several" "$phased" "$opened" "$worktreed"' EXIT
worktreed_project="$worktreed/some-project"
mkdir -p "$worktreed_project/system/foundation" "$worktreed_project/local/progressions"
cp system/foundation/current-progression.sh "$worktreed_project/system/foundation/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$worktreed_project/system/foundation/"

git -C "$worktreed_project" init -q -b master
commit "$worktreed_project" "2026-01-01T00:00:00Z"

control_worktree_branch="feature/worktree/some-cart"
git -C "$worktreed_project" worktree add -q -b "$control_worktree_branch" "$worktreed/some-cart"

mkdir -p "$worktreed/some-cart/local/progressions"
cat > "$worktreed/some-cart/local/progressions/2026-01-01T00-00-00Z-some-cart.md" <<RECORD
# Feature — Some cart

- **State:** Active
- **Progression branch:** \`$control_worktree_branch\`
RECORD

worktreed_progression=$(cd "$worktreed_project" && system/foundation/current-progression.sh)

[ "$worktreed_progression" = "$control_worktree_branch" ] || fail "Prints the branch of an progression recorded only in another worktree" "found:" "$worktreed_progression"

echo "0 failed, 0 aborted"
