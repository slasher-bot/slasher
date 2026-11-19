# Finds and reads a project's email configuration, slasher-email.toml. The
# imap package's fetch.py and the smtp package's send.py both read it, so one
# file configures both the fetch and the send of the project's accounts.
#
# The file is email/slasher-email.toml in the project's local directory,
# slasher/local/email/ or where the project's registry entry relocates it, or
# in the private store, ~/.local/share/slasher/email/<project>/. The project is
# looked in first. Each [[account]] table names one account the project uses,
# by the name its credential has in the Keychain, or <host>/<login> for an
# account with no name. Its [account.imap] table configures the account's
# fetch, and its [account.smtp] table its send. An account the file does not
# list is neither fetched nor sent through.

import os
import subprocess
import tomllib

FILE_NAME = "slasher-email.toml"


def local_directory():
    """The project's local directory, where foundation's local-directory.sh says,
    which may be outside the project. An installed foundation that predates the
    script keeps it in slasher/local, or local in the authoring source. A
    relocated directory that does not exist stops with the script's message."""
    script = os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "..", "foundation", "local-directory.sh"
    )
    if not os.access(script, os.X_OK):
        return "slasher/local" if os.path.isdir("slasher/local") else "local"
    result = subprocess.run([script], capture_output=True, text=True)
    if result.returncode != 0:
        raise SystemExit(result.stderr.strip())
    return result.stdout.strip()


def project_folder(folder):
    """The account's folder in the project's local directory."""
    return os.path.join(local_directory(), "email", folder)


def private_folder(folder):
    """The account's folder in the private store, out of the repository."""
    return os.path.join(
        os.environ["HOME"], ".local", "share", "slasher", "email",
        os.path.basename(os.getcwd()), folder,
    )


def path():
    """The project's email configuration file, or None where neither the
    project nor the private store holds one."""
    for directory in (project_folder(""), private_folder("")):
        candidate = os.path.join(directory, FILE_NAME)
        if os.path.isfile(candidate):
            return candidate
    return None


def accounts():
    """The accounts the project lists, as a dictionary of each account's name
    and its table, in the order listed. None where there is no file."""
    found = path()
    if found is None:
        return None
    with open(found, "rb") as file:
        listed = tomllib.load(file).get("account", [])
    return {table["name"]: table for table in listed if "name" in table}


def configuration(name):
    """The table of the account with that name, or None where the project
    does not list it."""
    return (accounts() or {}).get(name)


NO_LIST = ("This project lists no email account. List each one as an [[account]] "
           "table in email/" + FILE_NAME + ", in the project's local directory.")
