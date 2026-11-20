#!/bin/sh
# Usage:
#
#   slasher/system/foundation/local-directory.sh
#
# Run from the root of a Slasher project, or of one of its worktrees.
#
# Prints the project's local directory: the directory that holds its own rules,
# vocabulary, journal, logs, items, progressions, and migration records.
#
# Where the project's entry in the machine's project registry has a local key,
# that is the directory, as in:
#
#   [[project]]
#   path = "~/src/checkout"
#   local = "~/records/checkout"
#
# A leading ~ is this machine's home directory, and a relative path is read from
# the project's root. A worktree reads the entry of the project it belongs to, so
# every worktree uses the one directory. Where the configured directory does not
# exist, the script fails and names it. Nothing falls back to the default.
#
# Where there is no local key, the directory is slasher/local in a Slasher
# project, and local in the Slasher authoring source, relative to where the
# script runs. SLASHER_REGISTRY names another registry, so a test can use its own.

set -e

scripts=$(dirname "$0")

# The project a worktree belongs to is the working tree that holds the common git
# directory. Outside git, the project is where the script runs.
root=$PWD
common=$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null) || common=
if [ -n "$common" ] && [ "$(basename "$common")" = ".git" ]; then
  root=$(dirname "$common")
fi

configured=$(cd "$root" && "$scripts/read-project-setting.sh" local)

if [ -n "$configured" ]; then
  case $configured in
    "~") configured=$HOME ;;
    "~/"*) configured="$HOME/${configured#"~/"}" ;;
    /*) ;;
    *) configured="$root/$configured" ;;
  esac

  if [ ! -d "$configured" ]; then
    echo "The local directory configured for this project does not exist: $configured" >&2
    echo "Create it, or correct the local key in the project's entry in the project registry." >&2
    exit 1
  fi

  printf '%s\n' "$configured"
  exit 0
fi

if [ -d slasher/local ] || [ ! -d local ]; then
  echo slasher/local
else
  echo local
fi
