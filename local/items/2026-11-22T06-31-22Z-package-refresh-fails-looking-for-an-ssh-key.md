# The package refresh fails looking for an SSH key, and SLASHER_ORIGIN in the session environment has no effect

**State:** Resolved

**Tags:** [problem]

Reported by James Hughes:

> I tried to update a local repo with the changes you published on 11/17, but /packages refresh failed looking for an SSH key. I tried adding SLASHER_ORIGIN=https://github.com/slasher-botto claude’s session environment, but it didn’t have any effect. I was able to work around it by running slasher/system/foundation/refresh-packages.sh directly.

## James's answers, 2026-11-25

> Yes, I use SSH with github, but I'm not using github with the two specific repositories where I'm testing slasher. I also have a slightly unusual SSH key setup due to having multiple github accounts (ie. personal and work). So my ssh config file does not have an entry like Host github.com . My two ssh keys for github do not have passphrases.
> Here is the full error: The refresh failed because GitHub refused the SSH key. The sandbox may block access to the SSH agent, so I will try again outside the sandbox.
> In the Claude desktop app, I added it through the Environment UI, which is exposed in the 'Activity Panel' (right-hand rail in the app).
>
> Looking into this a bit and it looks like that method of setting environment variables does not actually affect command-line tool usage. I ran ! env | sort and SLASHER_ORIGIN doesn't appear. It doesn't seem to matter whether it's a new or existing session, so I'll assume "Environment variables" is only transmitted to the LLM backend.
>
> Putting SLASHER_ORIGIN=https://github.com/slasher-bot into my zshrc and starting a new claude chat session in the desktop app works, though.

## What the answers show

1. **SLASHER_ORIGIN never reached the script.** The desktop app's Environment setting does not reach the shell the agent runs commands in: `env` shows no `SLASHER_ORIGIN` there. Set in `~/.zshrc`, it does, and the refresh works.
2. **The SSH address cannot work on his machine.** His SSH config has no `Host github.com` entry, since he keeps two GitHub accounts under other host names. `git@github.com:slasher-bot` takes no key GitHub accepts for it, so GitHub refuses the key. The passphrase and host-key causes are ruled out.
3. **What stands.** A project has no place to keep its repository address. The scripts default to `git@github.com:`, which fails for anyone whose GitHub SSH keys sit under other host names, and the one override, `SLASHER_ORIGIN`, has to reach the shell.

## Progression

The implementation `2026-11-26T04-37-18Z-package-fetch-https` carries this item's work.

## Settled

- **2026-11-25** — The package scripts fetch over HTTPS by default. `install.sh`, `update-packages.sh`, and `slasher-install` take `https://github.com/slasher-bot` where `SLASHER_ORIGIN` is not set, in place of `git@github.com:slasher-bot`. `SLASHER_ORIGIN` stays as the override, as `SLASHER_ORIGIN=git@github.com:slasher-bot` for SSH. A Slasher project only pulls from the public package repositories, so HTTPS needs no key and no setup. Publishing from the composite pushes over SSH by its own addresses, and does not change. The README says so, and says that a variable set in the Claude desktop app's Environment setting does not reach the commands the agent runs, while one set in a shell profile does. Selected by the engineer, of three options: HTTPS by default, a stored address in the registry, or documentation only.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 22:31:22 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:34:54 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:19:07 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:21:39 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:28:26 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:37:18 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:43:38 PT
