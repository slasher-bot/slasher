EMAIL
  These commands fetch IMAP email into the project, send a message, and list
  the accounts whose credentials are kept in the macOS Keychain.

  /email                           An alias of /email fetch
  /email fetch                     Fetch every account the project lists
  /email fetch <name>              Fetch the listed account with that name
  /email fetch <host>              Fetch every listed account on that host
  /email send <name> <message-file>
                                   Send the message in the file through the
                                   account with that name, after you confirm
                                   it. Needs the smtp package
  /email list                      List every stored account, without
                                   credentials
  /email help                      Print this command's help

  A project lists its accounts in email/slasher-email.toml, in its local
  directory, an [[account]] table to each.
  A message file holds headers, then a blank line, then the body.
  After a fetch, each message it wrote is summarized in a line. After a
  send, the message sent is summarized.
  A credential is stored in your own terminal, never through the chat:
  slasher/system/imap/credential.sh write <host> <login> [--name <name>]
