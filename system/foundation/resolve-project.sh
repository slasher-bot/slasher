#!/bin/sh
# Usage:
#
#   slasher/system/foundation/resolve-project.sh -workspace
#   slasher/system/foundation/resolve-project.sh -system
#   slasher/system/foundation/resolve-project.sh -slasher-home
#   slasher/system/foundation/resolve-project.sh <name>
#
# Run from the root of a Slasher project.
#
# -workspace prints the root of the project's workspace project: the directory
# beside it that slasher.toml, in their shared parent directory, names.
#
# -system prints the root of the machine's system project: the path that
# ~/.config/slasher/system-project.toml records. SLASHER_SYSTEM_PROJECT
# names another file in its place, so a test can use its own.
#
# -slasher-home prints the Slasher home directory, which holds the
# development version of Slasher: the path that
# ~/.config/slasher/slasher-home.toml records. SLASHER_HOME_PROJECT names
# another file in its place, so a test can use its own. Where the machine
# declares no Slasher home directory, it prints nothing and exits non-zero.
# A leading ~ in the path is the home directory.
#
# <name> prints the root of the project in the machine's registry whose
# directory has that name, as list-projects.sh lists them. Where no
# registered project has that name, or more than one has, it prints nothing
# and exits non-zero.

set -e

case $1 in
  -workspace)
    parent=$(dirname "$PWD")

    name=$(
      sed -n 's/^[[:space:]]*workspace-project[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
        "$parent/slasher.toml"
    )

    printf '%s\n' "$parent/$name"
    ;;
  -system)
    config=${SLASHER_SYSTEM_PROJECT:-$HOME/.config/slasher/system-project.toml}

    sed -n 's/^[[:space:]]*path[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
      "$config"
    ;;
  -slasher-home)
    config=${SLASHER_HOME_PROJECT:-$HOME/.config/slasher/slasher-home.toml}

    if [ -f "$config" ]; then
      slasher_home=$(
        sed -n 's/^[[:space:]]*path[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
          "$config"
      )
    else
      slasher_home=
    fi

    if [ -z "$slasher_home" ]; then
      echo "No Slasher home directory is declared in $config" >&2
      exit 1
    fi

    # A leading ~ is the home directory, as it is in projects.toml.
    case $slasher_home in
      "~"|"~/"*) slasher_home=$HOME${slasher_home#"~"} ;;
    esac

    printf '%s\n' "$slasher_home"
    ;;
  *)
    name=$1

    resolved=$(
      "$(dirname "$0")/list-projects.sh" |
        while IFS= read -r registered; do
          if [ "$(basename "$registered")" = "$name" ]; then
            printf '%s\n' "$registered"
          fi
        done
    )

    if [ -z "$resolved" ]; then
      echo "No project named $name is in the registry" >&2
      exit 1
    fi

    if [ "$(printf '%s\n' "$resolved" | wc -l)" -gt 1 ]; then
      echo "More than one project named $name is in the registry:" >&2
      printf '%s\n' "$resolved" | sed 's/^/  /' >&2
      exit 1
    fi

    printf '%s\n' "$resolved"
    ;;
esac
