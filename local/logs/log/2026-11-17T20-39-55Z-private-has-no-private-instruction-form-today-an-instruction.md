# /private has no "/private <instruction>" form today. An instruction goes after "session", as in "/private session <instruction>", and other words are read as a file path or a subcommand. Which form ends the private session once its instruction is carried out? — Add /private <instr>, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> /private has no "/private <instruction>" form today. An instruction goes after "session", as in "/private session <instruction>", and other words are read as a file path or a subcommand. Which form ends the private session once its instruction is carried out?

The options:

- **/private session <instr>** — "/private session <instruction>" carries out the instruction privately, then ends the session. No new form is added.
- **Add /private <instr>** — Words that are not a subcommand or an existing file become an instruction: carried out privately, then the session ends. "/private session <instruction>" does the same. Today such words are not guessed at and prompt a question.

The engineer's answer: **Add /private <instr>**
