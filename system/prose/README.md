# Slasher — prose

Rules and commands for working on content: prose written for people to read, such as a page, a README, an article, or a draft.

- **`/prose` reviews content through its subcommands** (`prose-reviews-content-through-its-subcommands`). Its subcommands are `edit`, `suggest`, `critique`, `accept`, and `reject`, and `/prose help` lists them. `/edit`, `/review`, `/accept`, and `/reject` are short forms of `/prose edit`, `/prose suggest`, `/prose accept`, and `/prose reject`.
- **Edit walks the content paragraph by paragraph, then sentence by sentence** (`edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence`). `/prose edit` numbers the paragraphs p1, p2 and their sentences s1, s2, and shows each paragraph with its findings. Each finding carries a numbered suggestion, which the engineer accepts, rejects, or ignores.
- **`/prose suggest` suggests numbered edits to content, and accept or reject settles them** (`prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them`). It changes nothing. Each suggestion shows the original text, the suggested text, and a reason. `/prose accept` shows the result and writes it only on the engineer's selection. `/prose reject` drops suggestions. A suggestion stays pending until one of the two settles it.
- **`/prose critique` gives an overall critical review of content** (`prose-critique-gives-an-overall-critical-review-of-content`). It judges the content whole, gives a numbered list of findings, most important first, and changes nothing.
- **Content is judged by named criteria for each paragraph and each sentence** (`content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence`). Each review names its criterion in each finding: four for a paragraph, three for a sentence. A clean passage is said to be clean. The check on writing that draws the reader's conclusion is the `language` package's writing-states-the-evidence-and-the-reader-draws-the-conclusion rule, which is why this package includes `language`.

**What this package deliberately does not hold.** The rules for Slasher's own prose stay in the `language` package. That package governs how the agent and the records write. This package governs work on the engineer's content.

**Why it is called prose.** It names the material the package acts on. Not *content*: the installer already has a package set of that name, and a package of the same name could not be installed by name.

Includes `foundation`, `language`.

```
prose  →  language  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `slasher/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
git subtree pull --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/prose.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

It depends on `language` and `foundation`. Install its dependencies from the root of the Slasher project:

```
slasher/system/prose/install-dependencies.sh
```

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix slasher/system/prose git@github.com:slasher-bot/prose.git master --squash
```


## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
