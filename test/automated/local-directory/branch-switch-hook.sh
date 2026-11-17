#!/bin/sh
# Usage:
#
#   test/automated/local-directory/branch-switch-hook.sh
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

parent=$(mktemp -d)
trap 'rm -rf "$parent"' EXIT
parent=$(cd "$parent" && pwd -P)

project="$parent/some-project"
records="$parent/some-records"
mkdir -p "$project/slasher/system/foundation" "$records"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"

registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML
mkdir -p "$project/slasher/system/git"
cat > "$project/slasher/system/git/branch-switch.sh" <<'SCRIPT'
#!/bin/sh
touch "$(dirname "$0")/some-run"
SCRIPT
chmod +x "$project/slasher/system/git/branch-switch.sh"
cat > "$records/2026-01-01T00-00-00Z-some-package-set.md" <<'DECLARATION'
- **Package set:** default, -git
- **Packages:** foundation
- **Inactive:** git
DECLARATION

# Actuation ------------------------------------------------------------------

CLAUDE_PROJECT_DIR="$project" SLASHER_REGISTRY="$registry" system/foundation/plugin/hooks/branch-switch < /dev/null || true

# Where the relocated directory's package set deactivates git

[ ! -e "$project/slasher/system/git/some-run" ] || fail "Does not run the branch-switch script"

echo "0 failed, 0 aborted"
