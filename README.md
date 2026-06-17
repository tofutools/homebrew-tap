# homebrew-tap

Homebrew tap for [Tofu Tools](https://github.com/tofutools).

## tclaude

[`tclaude`](https://github.com/tofutools/tclaude) — tmux-based multi-agent
session manager for Claude Code and Codex CLI.

```bash
brew install tofutools/tap/tclaude
```

Or tap first, then install by short name:

```bash
brew tap tofutools/tap
brew install tclaude
```

The formula builds from source, so it needs the Go toolchain (pulled in
automatically as a build dependency) and installs `tmux` as a runtime
dependency. After installing, run:

```bash
tclaude setup --<install-flags> # see --help
```

To upgrade:

```bash
brew update && brew upgrade tclaude
```

### Maintenance

`Formula/tclaude.rb` is updated automatically by the `tclaude` release
workflow on every release — it bumps the `url` tag and `sha256` of the
GitHub source tarball. No manual edits are normally required.
