EMAIL
  These commands fetch IMAP email into the project, send a message, and list
  the accounts whose credentials are kept in the macOS Keychain.

  /email                           An alias of /email fetch
  /email fetch                     Fetch every account
  /email fetch <name>              Fetch the account with that name
  /email fetch <host>              Fetch every account on that host
  /email send <name> <message-file>
                                   Send the message in the file through the
                                   account with that name, after you confirm
                                   it. Needs the smtp package
  /email list                      List the accounts, without credentials
  /email help                      Print this command's help

  A message file holds headers, then a blank line, then the body.
  A credential is stored in your own terminal, never through the chat:
  slasher/system/imap/credential.sh write <host> <login> [--name <name>]
