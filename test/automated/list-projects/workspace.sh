#!/bin/sh
# Usage:
#
#   test/automated/list-projects/workspace.sh
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

scripts=$PWD/system/foundation

# Controls -------------------------------------------------------------------

parent=$(mktemp -d)
trap 'rm -rf "$parent"' EXIT

slasher_project() {
  mkdir -p "$1/slasher/system"
  git init -q "$1"
}

control_project="$parent/some-project"
slasher_project "$control_project"

control_workspace="$parent/some-workspace"
slasher_project "$control_workspace"
mkdir -p "$control_workspace/slasher/local"

control_workspace_member="$parent/some-workspace-member"
slasher_project "$control_workspace_member"

control_machine_project="$parent/some-machine-project"
slasher_project "$control_machine_project"

cat > "$parent/slasher.toml" <<'CONFIG'
workspace-project = "some-workspace"
CONFIG

# The workspace list names a project the machine list also names, so it is
# listed once.
cat > "$control_workspace/slasher/local/projects.toml" <<'REGISTRY'
[[project]]
path = "some-workspace-member"

[[project]]
path = "some-project"
REGISTRY

cat > "$parent/machine-projects.toml" <<REGISTRY
[[project]]
path = "$control_machine_project"

[[project]]
path = "$control_project"
journal = "private"
REGISTRY

# Actuation ------------------------------------------------------------------

projects=$(cd "$control_project" && SLASHER_REGISTRY="$parent/machine-projects.toml" "$scripts/list-projects.sh")

control_projects=$(printf '%s\n' "$control_machine_project" "$control_project" "$control_workspace_member" | sort)

# Lists the projects in the machine list and the workspace list, each once

[ "$projects" = "$control_projects" ] || fail "Lists the projects in the machine list and the workspace list, each once" "projects:" "$projects"

echo "0 failed, 0 aborted"
