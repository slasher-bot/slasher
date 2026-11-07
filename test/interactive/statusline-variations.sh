#!/bin/sh
# The status line, printed in each of its variations, for a person to read.
#
# Usage:
#
#   test/interactive/statusline-variations.sh
#
# Run from the repository root.
#
# It builds two control projects, a checkout repository in this repository's arrangement and an
# installed project under slasher/, and runs this repository's statusline.sh in each, as the
# implementation records and branches change. It prints each status line under a heading naming
# the case. A person judges what came back, so it asserts nothing.
#
# A global git ignore rule can hide the control project's untracked file, and then case 6 shows
# no untracked files segment.
set -e
src="$(pwd)/system/foundation"
S=$(mktemp -d)
trap 'rm -rf "$S"' EXIT

mkrecord() { # dir file title state branch
  mkdir -p "$(dirname "$1/$2")"
  printf '# Feature — %s\n\n- **State:** %s\n- **Implementation branch:** `%s`\n' "$3" "$4" "$5" > "$1/$2"
}
at() { # repo date
  GIT_AUTHOR_DATE="$2" GIT_COMMITTER_DATE="$2" git -C "$1" -c user.name=sim -c user.email=sim commit -q --allow-empty -m sim
}
save() { # repo date
  git -C "$1" add -A
  GIT_AUTHOR_DATE="$2" GIT_COMMITTER_DATE="$2" git -C "$1" -c user.name=sim -c user.email=sim commit -q -m sim
}
show() { # title repo system-dir
  echo "== $1"
  (cd "$2" && "$3/foundation/statusline.sh" < /dev/null) | sed "s/$(printf '\033')\[[0-9]*m//g"
  echo
}

p="$S/checkout"
mkdir -p "$p/system/foundation"
cp "$src/statusline.sh" "$src/current-implementation.sh" "$p/system/foundation/"
echo x > "$p/system/foundation/README.md"
git -C "$p" init -q -b master
mkrecord "$p" local/implementations/2026-01-01T00-00-00Z-cart-COMPLETED.md "Cart" Completed feature/cart
save "$p" 2026-01-01T00:00:00Z
show "1. Nothing current: the only record is Completed" "$p" system

mkrecord "$p" local/implementations/2026-01-02T00-00-00Z-receipt-ACTIVE.md "Receipt" Active feature/receipt
save "$p" 2026-01-02T00:00:00Z
git -C "$p" branch feature/receipt
show "2. One feature Active, feature/receipt, with the working tree on master" "$p" system

git -C "$p" switch -q -c feature/receipt.tax-line feature/receipt
at "$p" 2026-01-03T00:00:00Z
show "3. Its phase tax-line under way, with the working tree on the phase branch" "$p" system

git -C "$p" switch -q master
mkrecord "$p" local/implementations/2026-01-04T00-00-00Z-discounts-SUSPENDED.md "Discounts" Suspended experiment/discounts
save "$p" 2026-01-04T00:00:00Z
git -C "$p" switch -q -c experiment/discounts
at "$p" 2026-01-05T00:00:00Z
git -C "$p" switch -q master
show "4. A Suspended experiment, experiment/discounts, committed after the phase" "$p" system

git -C "$p" switch -q feature/receipt.tax-line
at "$p" 2026-01-06T00:00:00Z
git -C "$p" switch -q master
show "5. The receipt phase committed again, after the experiment" "$p" system

echo some > "$p/receipt-draft.md"
show "6. The same, with an untracked file in the working tree" "$p" system
rm "$p/receipt-draft.md"

i="$S/shop"
mkdir -p "$i/slasher/system/foundation"
cp "$src/statusline.sh" "$src/current-implementation.sh" "$i/slasher/system/foundation/"
echo x > "$i/slasher/system/foundation/README.md"
git -C "$i" init -q -b master
mkrecord "$i" slasher/local/implementations/2026-01-01T00-00-00Z-payment-ACTIVE.md "Payment" Active feature/payment
save "$i" 2026-01-01T00:00:00Z
git -C "$i" switch -q -c feature/payment
at "$i" 2026-01-02T00:00:00Z
show "7. An installed project, slasher/, with feature/payment Active and checked out" "$i" slasher/system
