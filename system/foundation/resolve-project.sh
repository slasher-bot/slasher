#!/bin/sh
# Usage:
#
#   slasher/system/foundation/resolve-project.sh -base
#   slasher/system/foundation/resolve-project.sh -system
#
# Run from the root of a Slasher project.
#
# -base prints the root of the project's base project: the directory
# beside it that slasher.toml, in their shared parent directory, names.
#
# -system prints the root of the machine's system project: the path that
# ~/.config/slasher/system-project.toml records. SLASHER_SYSTEM_PROJECT
# names another file in its place, so a test can use its own.

set -e

case $1 in
  -base)
    parent=$(dirname "$PWD")

    name=$(
      sed -n 's/^[[:space:]]*base-project[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
        "$parent/slasher.toml"
    )

    printf '%s\n' "$parent/$name"
    ;;
  -system)
    config=${SLASHER_SYSTEM_PROJECT:-$HOME/.config/slasher/system-project.toml}

    sed -n 's/^[[:space:]]*path[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
      "$config"
    ;;
esac
