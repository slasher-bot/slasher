#!/bin/sh
# Usage:
#
#   test/automated/default-origin/update-packages.sh
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

# Default Origin
#   update-packages.sh

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT
repository=$(pwd)
home="$directory/home"
mkdir -p "$home"

export GIT_AUTHOR_NAME="some name" GIT_AUTHOR_EMAIL="some-email" GIT_COMMITTER_NAME="some name" GIT_COMMITTER_EMAIL="some-email"

# A stand-in git records every address it is given, and refuses any GitHub address, so nothing
# reaches the network. Every other command passes to the real git.
real_git=$(command -v git)
stand_in="$directory/bin"
addresses="$directory/addresses"
mkdir -p "$stand_in"
cat > "$stand_in/git" <<STANDIN
#!/bin/sh
for argument in "\$@"; do
  case \$argument in
    *github.com*) echo "\$argument" >> "$addresses"; exit 1 ;;
  esac
done
exec "$real_git" "\$@"
STANDIN
chmod 755 "$stand_in/git"

project="$directory/some-project"
mkdir -p "$project/slasher/system"
git -C "$project" init -q -b master
cp -R system/foundation "$project/slasher/system/"
echo "@slasher/SLASHER.md" > "$project/AGENTS.md"
git -C "$project" add -A
git -C "$project" commit -q -m "some commit"

# Actuation ------------------------------------------------------------------

(cd "$project" && env -u SLASHER_ORIGIN PATH="$stand_in:$PATH" HOME="$home" slasher/system/foundation/update-packages.sh foundation) > /dev/null 2>&1 || true

# Observation ----------------------------------------------------------------

first=$(head -1 "$addresses" 2> /dev/null || true)

case $first in
  https://github.com/slasher-bot/*) ;;
  *) fail "Fetches over HTTPS where SLASHER_ORIGIN is not set" "found:" "$first" ;;
esac

echo "0 failed, 0 aborted"
