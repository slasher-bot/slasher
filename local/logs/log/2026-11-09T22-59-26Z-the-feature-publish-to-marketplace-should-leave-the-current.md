# The feature "Publish to marketplace" should leave the current list, but be more like discontinued. The rules allow no state word they do not list. Which should it take? — Add "Discontinued", selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The feature "Publish to marketplace" should leave the current list, but be more like discontinued. The rules allow no state word they do not list. Which should it take?

The options:

- **Inconclusive** — An existing state: the forecast was never settled. It ends the feature and leaves the current list. Returning later means a new feature that names this one.
- **Abandoned** — An existing state: dropped before it concluded. It ends the feature and leaves the current list. Returning later means a new feature.
- **Add "Discontinued"** — Amend foundation's implementations rule to add a Discontinued state: stopped with no plan to resume soon, not current, and able to resume. The rule changes and the package is republished.

The engineer's answer: **Add "Discontinued"**
