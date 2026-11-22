# Work Session — doc-edit in the prose package

This work session started as a comparison of Slasher's prose commands with the doc-edit skill, became a feature that brought doc-edit's way of reviewing into the `prose` package, and ended with the check on writing that draws the reader's conclusion stated once, in `language`.

This is the communicable record of the work session, a guided tour. The items, progression record, rules, and log entries it points to are the source of truth.

## 1. The comparison

The engineer started the work item to compare Slasher's prose utilities with doc-edit, as an Active item on `master`. The comparison went into the item: doc-edit walks a document paragraph by paragraph, then sentence by sentence, with named criteria and no rewrites. The prose commands review the whole text in one answer, suggest wording, and settle each suggestion. Asked when doc-edit came into existence, the agent found it was built in a Claude desktop session on Thu May 14 2026. The engineer stated it is not Claude's own, and the item was corrected to name it as the engineer's skill.

- Item: `2026-11-16T20-00-50Z-compare-slashers-prose-utilities-with-the-doc-edit-skill`, Active

## 2. Three approaches

Asked to propose an approach, the agent put three: a walk-through command, doc-edit's criteria in the existing commands, or both. The engineer asked for more detail, then for a recommendation. The agent recommended both, built criteria first. The engineer selected both, with the command named `/edit` rather than a walk-through.

- Item: `2026-11-17T02-07-24Z-doc-edit-is-incorporated-into-the-prose-package`, Completed

## 3. The feature, unattended

The feature ran in a worktree, unattended, by a plan the engineer accepted. A **criteria rule** names four paragraph criteria and three sentence criteria. `/review` and `/print-and-review` judge by it, and each finding names its criterion. `/edit` numbers the paragraphs and walks them with `next`, `previous`, `p<n>`, `sentences`, and `print`, giving findings with no rewrite. A rewrite asked for becomes a `/review` suggestion.

- Rules: content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence, edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence
- Progression record: `2026-11-17T02-07-24Z-prose-edit`, Completed

## 4. One rule, not two

The engineer asked whether any prose rule belonged in `language`. None did, but the check on writing that draws the reader's conclusion overlapped a `language` rule against characterizing the work. The engineer stated the rule should not be duplicated, and asked for a solution with no duplication. The agent proposed one rule in `language`, which the answer-is-a-list rule points to and the criteria rule uses, and the engineer selected it. `prose` now includes `language`, since its criteria rule cannot be applied without that rule.

- Rule: writing-states-the-evidence-and-the-reader-draws-the-conclusion

## 5. The conclusion

The engineer concluded the feature Completed. It merged to `master`, and the automated suite passed: 80 test files. The worktree and the branch were removed on the engineer's selection.

## Takeaways

- Every prose review judges by the same named criteria, and each finding names its criterion.
- `/edit` walks a text one paragraph at a time, and settles a rewrite through `/review`.
- A stance two packages share is stated once, and the other package uses it, declaring the dependency where its rule cannot work without it.
- doc-edit is the engineer's own skill, synced from the engineer's account, and it is unchanged.

## Glossary

- **criterion**: one of the seven named checks a review of content judges by, such as clarity and concision, or precision.
- **walk**: `/edit`'s pass through a text, one numbered paragraph at a time.

## Where the durable records live

- Rules: the four `prose` rules in `system/prose/source/`, and writing-states-the-evidence-and-the-reader-draws-the-conclusion in `system/language/source/`
- Items: the comparison item, and the doc-edit incorporation work item
- Progression record: `2026-11-17T02-07-24Z-prose-edit`
- Log entries, in `local/logs/log/`, from `2026-11-16T23-15-47Z`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 18:21:10 PT
