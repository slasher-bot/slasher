# Slasher — prose

Rules and commands for working on content: prose written for people to read, such as a page, a README, an article, or a draft.

- **The review command suggests numbered edits to content, and accept or reject settles them** (`the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them`). `/review` suggests edits and changes nothing. Each suggestion shows the original text, the suggested text, and a reason. `/review accept` shows the result and writes it only on the engineer's selection. `/review reject` drops suggestions. A suggestion stays pending until one of the two settles it.
- **Print-and-review prints the draft and a review of it** (`print-and-review-prints-the-draft-and-a-review-of-it`). `/print-and-review`, or `/pr`, prints the draft as it now stands, then a numbered list of findings. `/review help` lists both commands.

**What this package deliberately does not hold.** The rules for Slasher's own prose stay in the `language` package. That package governs how the agent and the records write. This package governs work on the engineer's content.

**Why it is called prose.** It names the material the package acts on. Not *content*: the installer already has a package set of that name, and a package of the same name could not be installed by name.

Includes `foundation`.

```
prose  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `slasher/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
git subtree pull --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/prose.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

It depends on `foundation`. Install its dependencies from the root of the Slasher project:

```
slasher/system/prose/install-dependencies.sh
```

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
```


## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
