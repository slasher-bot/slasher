# Implementation — Startup sentence shortcut aliases in parentheses

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Put shortcut alias in parenthese in the startup display that lists the other commands in comma-delimieted sentence form. Eg: Instead of "/commit, /c", print "/commit (/c)". Do this for all shortcut alias commands. Ask me about each alias identified for reformatting first, and then proceed with the work. Do this unattended.

**The sentence below the startup table names each shortcut alias in parentheses after its command, as `/commit (/c)`, not as a command of its own.** The work item states the tasks.

Realizes the work item `2026-11-21T21-23-00Z-the-startup-sentence-puts-a-shortcut-alias-in-parentheses`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/startup-alias-parentheses`
- **Base:** `d72490ff`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-startup-alias-parentheses`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked in the request.
- **Forecast:** none given.
- **Item:** `2026-11-21T21-23-00Z-the-startup-sentence-puts-a-shortcut-alias-in-parentheses`

## The aliases, as the engineer selected them on 2026-11-21

- Reformatted: `/push (/p)`, `/commit (/c)`, `/commit-and-push (/cp)`, `/ask-again (/aa)`, and `/shortcuts (/sc)`. These are every shortcut alias the sentence names.
- Not reformatted: `/proceed`, `/implementation`, and `/implementations`. Each is an alias by name, not a shortcut, and stays a command of its own in the sentence.

## Plan, as accepted on 2026-11-21

1. Start an unattended implementation for the work item, on a branch and a worktree.
2. The plugin build puts each selected alias in parentheses after its command in the startup sentence.
3. The rule that describes the startup sentence, and its test, say so.
4. Compile, run the automated suite, and commit on the branch.
5. The merge to `master` and the conclusion wait for the engineer.

## What happened

- The plugin build reads the shortcuts table. In the startup sentence, a shortcut alias whose name starts with a letter stands in parentheses after its row's command. The sentence now reads `/push (/p)`, `/commit (/c)`, `/commit-and-push (/cp)`, `/ask-again (/aa)`, and `/shortcuts (/sc)`.
- `/proceed`, `/implementation`, and `/implementations` stay commands of their own in the sentence.
- A sentence with no other command to name is no longer written as an empty name.
- A new test, `command-table-startup-shortcut-alias.sh`, failed before the change and passes after it.
- The a-command-domain-carries-its-rows-of-the-command-table rule says so, with a History line. It carries no compressed text.
- The automated suite passed: 139 test files.

## Confirmations

- **2026-11-21** — Creation: started unattended by `/work`, with the request to do the work unattended. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-21** — Participation: unattended, as the engineer asked.
- **2026-11-21** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 1:24:19 PM PT
Changed by Scott Bellware on Sat Nov 21 2026 at 1:28:45 PM PT
