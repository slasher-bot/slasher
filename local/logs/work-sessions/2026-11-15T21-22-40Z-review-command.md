# Work Session — The /review command and the prose package (2026-11-15)

This work session started with an idea for an `/edit` command that suggests edits to content. It became a feature, which renamed the command four times and settled its design in five decisions. It created a new package, `prose`, to carry it, and changed which packages this repository activates. It ended with `/review` merged to `master`, and with Claude Code's built-in `/review` known to take the bare name.

This is the communicable record of the work session, a guided tour. The items, progression record, rule, package-set declarations, and log entries it points to are the source of truth.

## 1. The feature, started for item 2

After a publish of `foundation` and a push, the engineer typed `/feature start #2`, for the idea of an `/edit` command. No feature was Open, so the feature was created Active. The engineer selected a branch and worktree, attended work, and no forecast. Attended work was recommended, since the agent's confidence was 55%.

- Item: `2026-11-14T14-42-30Z-edit-command-suggests-edits-to-content`, now Realized
- Progression record: `2026-11-15T19-38-31Z-review-command`

## 2. The command's name

The engineer renamed `/edit` to `/suggest`, then `/suggest` to `/review`. The branch, the worktree, and the record followed each rename. Claude Code's own program shows a built-in code-review command whose alias is `review`. The engineer selected `/suggest` to avoid it, then changed it back to `/review`. The rule now says to type `/slasher:review` where the built-in is present. The branch kept the name review-command through the last two changes.

## 3. The design

A command made of prose has no automated test, so its design questions were put as decisions rather than as test hinges. Each is in the progression record.

- **Use site**: `/review <content>` names the content, and a bare `/review` takes the content the conversation is on.
- **Numbered suggestions**: `/review accept 1 3` and `/review reject 2` settle some suggestions. With no numbers, they settle all.
- **Display**: each suggestion shows the original text, the suggested text, and a one-line reason.
- **Pending suggestions**: a later `/review` adds after them, and the numbering continues. The engineer asked first whether replacing them would lose them.
- **Accepting**: the result is shown first, and written to the file only on the engineer's selection.

## 4. The package

The engineer selected a new `content` package, which also realized item 3. The installer already has a package set named `content`, which would shadow a package of the same name, so the engineer renamed it `prose`. The installer's `content` set includes `prose`, and `default` does not.

- Item: `2026-11-14T14-43-02Z-a-content-package-for-content-editing-rules-and-commands`, now Realized
- Package: `system/prose/`, with the rule the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them

## 5. The package set here

A package written after a set is declared starts out inactive. The engineer activated `prose` here by a new declaration. That declaration listed `imap` and `smtp` as inactive, and the plugin build then dropped `/email` and `/smtp`. The engineer activated them too, by a later declaration, so every installed package is active here.

- Declarations: `local/2026-11-15T20-23-01Z-default-prose-package-set.md` and `local/2026-11-15T20-30-42Z-default-prose-imap-smtp-package-set.md`

## 6. The conclusion

The engineer concluded the feature Completed. It merged to `master`, with one conflict on item 3, whose state had changed on both branches. The automated suite passed: 72 test files. The worktree and the branch were removed on the engineer's selection.

## Takeaways

- `/review` suggests numbered edits and changes nothing until accepted, and accepting shows the result before writing.
- Claude Code's built-in code-review command takes `/review`, so the plugin's command is `/slasher:review` where that is present.
- A package and a package set cannot share a name in the installer.
- A new package-set declaration's **Inactive:** line decides which skills the plugin build leaves out.

## Glossary

- **prose package** — the package for work on the engineer's content, as distinct from `language`, which governs Slasher's own prose.
- **pending suggestion** — a suggestion that is neither accepted nor rejected.

## Where the durable records live

- `local/items/`: the edit command idea and the content package idea, both Realized.
- `local/progressions/`: the review command progression record.
- `local/`: the two package-set declarations.
- `local/logs/log/`: an entry for each decision and each change of state.
- `system/prose/`: the package, its rule, and the `review` skill.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 1:22:40 PM PT
