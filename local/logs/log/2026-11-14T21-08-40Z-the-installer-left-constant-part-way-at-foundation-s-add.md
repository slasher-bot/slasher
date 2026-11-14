# The installer left constant part-way, at foundation's add, because an ignored .DS_Store kept the removed package's folder. How is it taken from here? — Resume, then fix, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The installer left constant part-way, at foundation's add, because an ignored .DS_Store kept the removed package's folder. How is it taken from here?

The options:

- **Fix, then resume (Recommended)** — Fix the installer test-first, through the hinges: it removes what is left of a package's folder before adding it again. Then run it again in constant, which resumes where it stopped.
- **Resume, then fix** — Remove the .DS_Store in constant and run the installer again now, which resumes. Fix the installer afterward, test-first.

The engineer's answer: **Resume, then fix**
