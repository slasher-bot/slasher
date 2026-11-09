![Slasher](material/slasher-logo-wide.png)

# Human in the Loop AI

The engineer decides. The agent generates. Humanity rules.

Where there is ambiguity, the agent gives the engineer options, including the option to take over.

## Install Slasher

Slasher's packages are installed using `git subtree`. Each package is its own subtree, which allows the packages to be refreshed from the source.

Install all of Slasher's packages at once with:

```
curl -O https://raw.githubusercontent.com/slasher-bot/slasher/master/install
sh install
```

The `install` script installs and refreshes packages. It optionally takes a list of names that contains either the names of packages, or a named _package set_. With no arguments it installs the default set of packages.

### Warning

Execute the install script using `sh`:

`sh install`

The script fetches the packages over SSH. Where no SSH key is registered, run it as `SLASHER_ORIGIN=https://github.com/slasher-bot sh install`.

The file is committed as an executable, but `curl` transfers content and not file metadata. The copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other script reaches a project by `git subtree`, which does preserve the mode.

### Package sets

A **package set** is a named list of packages, so a configuration that is wanted more than once is asked for by name rather than assembled again. Two exist:

- **`default`** — `foundation`, `language`, `testing`, `git`, `versioning`, `design-by-efferent`, `journal`. Everything except the tool-specific packages. This is what no arguments installs.
- **`content`** — `foundation`, `language`, `git`, `versioning`, `journal`. For a project whose product is prose or pages: articles, lessons, slide decks, a site. It leaves out `design-by-efferent`, whose five hinges are a design method for a unit of code, and `testing` with it.

```
sh install                 # the default set
sh install content         # a package set
sh install foundation git  # packages by name
sh install content journal # a set and a package together
```

A set's members are installed as ordinary packages. Nothing records which set asked for them, and a project that installed `content` is indistinguishable afterward from one that named those five packages itself.


## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification without assent. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
