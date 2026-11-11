# An smtp package sends email, and an email package includes it and imap

- **State:** Open
- **Tags:** [idea]

**An `smtp` package sends email.** An `email` package includes `smtp` and `imap` as its dependencies. Sending and receiving stay in separate packages because sending a message is less safe than receiving one. A confirmation step before a send, or saving the message to drafts in place of sending it, might reduce that risk.

**As the engineer stated it:** SMTP package that can send email. Email package that has both as a dependency. They are separate because sending messages is less safe that receiving. Although, this might be mitigated with a confirmation step, or a saving to drafts.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 3:12:11 PM PT
