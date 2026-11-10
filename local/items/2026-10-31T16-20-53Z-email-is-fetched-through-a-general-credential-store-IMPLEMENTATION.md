# Email is fetched through a general mechanism, with a general token or credential store

- **State:** Implementation
- **Tags:** [idea]

**A general way to fetch email, which is not tied to one provider, reads its access from a general store of tokens or credentials.** The store serves the email fetch, and is not specific to it.

**Not yet settled:**

- what the fetched email is for
- which providers and protocols the fetch covers
- where the store lives, which is outside any repository, as per-machine configuration is, so that no credential is committed

## Settled

- **2026-11-09** — The fetch covers IMAP only, for now. **As the engineer stated it:** "It will only be IMAP for now". This settles which providers and protocols the fetch covers: any IMAP server.
- **2026-11-09** — The fetched email is stored in the project, either in its local files or in the project's private store. **As the engineer stated it:** "The fetched email is stored in the project, either in the local files or in the project's private store". This settles what the fetched email is for.

**Implementation:** the feature `2026-11-10T06-02-53Z-general-email-fetch` carries this idea's work.

## History

As the engineer first stated it: "Idea: generalized email fetch with generalized token or credential store"

---

Authored by Scott Bellware on Sat Oct 31 2026 at 9:20:53 AM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:02:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:09:55 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:12:45 PM PT
