# An smtp package sends email

- **State:** Open
- **Tags:** [idea]

**An `smtp` package sends email.** Sending stays in a package separate from `imap`, which receives, because sending a message is less safe than receiving one. A confirmation step before a send, or saving the message to drafts in place of sending it, might reduce that risk.

**As the engineer stated it:** SMTP package that can send email. Email package that has both as a dependency. They are separate because sending messages is less safe that receiving. Although, this might be mitigated with a confirmation step, or a saving to drafts.

**As the engineer later stated it:** Remove the part about the email package from #3

---

Authored by Scott Bellware on Wed Nov 11 2026 at 3:12:11 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:49:45 PM PT
