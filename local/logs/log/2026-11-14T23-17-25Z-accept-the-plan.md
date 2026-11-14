# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a test first. A stand-in program named `claude` runs the session-start script with `/load` as its argument. The test expects no load line in the message.
> 2. Add two more tests. With `/load help`, the load line prints. With no `claude` process found, the load line prints.
> 3. Write a new script, `started-with-load.sh`. It reads the command lines of the processes above it, finds the `claude` process, and succeeds where its prompt is `/load`, `/slasher:load`, or `load rules`.
> 4. Make the session-start script leave out the load line where the new script succeeds.
> 5. Add a sentence on this case to the startup-display rule and the harness-announces rule. Compile the rules.
> 6. Run the automated suite.
> 7. Make the record Active at the start, and Completed after the suite passes.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
