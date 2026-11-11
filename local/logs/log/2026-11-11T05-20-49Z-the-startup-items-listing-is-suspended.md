# The current items no longer print at session start, because listing them made the start of a session take too much time

**Tags:** [decision] [suspended]

The read ran `/items 10` after the startup table and printed the ten most recent current items and the current implementations. It showed the engineer where the work stood before the first request, and it cost a slow start to every session. `/items` still prints the same list when asked for. The `/command-table` paragraph, the Why and How to apply lines, and the Related list of the the-command-domain-table-prints-when-the-rules-have-loaded rule no longer name it.
