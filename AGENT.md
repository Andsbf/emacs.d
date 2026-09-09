# AGENT.md

Personal Emacs configuration (macOS, Emacs and git from `~/.nix-profile`).
Read this before making changes.

## Version control: this repo uses jj, not git

The repo is colocated (`.jj/` and `.git/` both present). Use `jj` for all
version-control work; reach for `git` only to read history or to inspect
package checkouts under `straight/repos/`.

- There is no staging area. jj snapshots the working copy automatically, so
  every edit is already part of the working-copy commit (`@`).
- Inspect with `jj st` and `jj diff`; view history with `jj log`.
- Commit with `jj commit -m "..."`. To split unrelated changes into separate
  commits, pass filesets: `jj commit config.org -m "..."` commits only that
  path and leaves the rest in the working copy.
- Branches are bookmarks, and they do not move on their own. After committing,
  `main` stays where it was — advance it with `jj bookmark set main -r @-`.
- `main` tracks `origin`. Push only when asked: `jj git push`.

Do not run `git commit`, `git add`, or `git checkout` here.

## Literate configuration

`config.org` is the only file to edit. `init.el` bootstraps straight.el and
then calls `org-babel-load-file` on it, which tangles `config.org` into
`config.el`. That means:

- `config.el` is generated and gitignored. Never edit it; changes there are
  silently overwritten on next start.
- Emacs Lisp lives in `#+begin_src emacs-lisp` blocks under org headings
  grouped by topic (Sensible Defaults, UI Preferences, Programming Languages,
  Terminal, AI Tools, Utility Packages, My Functions, …). Put a change in the
  section it belongs to rather than appending to the end.
- `init.el` holds only what must run before the config: straight bootstrap,
  `straight-built-in-pseudo-packages`, the weekly recipe-update prompt.
- `custom.el` is the Customize write target, loaded from the Miscellaneous
  Settings section. Leave it to Customize; put deliberate settings in
  `config.org`.

To check that an edit tangles and parses without starting Emacs:

```sh
emacs --batch --eval '(progn (require (quote ob-tangle)) (org-babel-tangle-file "config.org" "/tmp/config-check.el" "emacs-lisp"))'
```

## Packages

straight.el with `straight-use-package-by-default t`, so a bare
`(use-package foo)` installs from MELPA/GNU ELPA. Use an explicit
`:straight (:host github :repo "...")` only for packages with no recipe, and
`:straight nil` for built-ins (`project`, `flymake`, `recentf`, `savehist`, …).

- `straight/` is gitignored except `straight/versions/default.el`, the tracked
  lockfile. If you deliberately move a package to a new commit, update its pin
  there in the same commit as the config change that needs it.
- Recipe repositories are refreshed at most weekly, prompted on first idle
  after startup (see `init.el`).

## Conventions

- Personal functions are prefixed `ando-` or `ando/`; match the neighbours.
- Settings carry a trailing comment explaining *why*, not what. Keep that up —
  it is the main reason this config is readable.
- Languages use built-in tree-sitter modes plus eglot. Adding one means:
  `auto-mode-alist` → `*-ts-mode`, a grammar in
  `treesit-language-source-alist`, an `eglot-server-programs` entry, and an
  `eglot-ensure` hook.
- `C-c` is crowded — `C-c p` project, `C-c n` org-roam, `C-c f` folding,
  `C-c !` flymake, `C-c t`/`C-c T` terminals, `C-c C-'` Claude. Check for a
  collision before binding.

## Gotchas

- A global git config rewrites `https://github.com/` to `ssh://git@github.com/`,
  so any clone (including straight's) needs a usable ssh key. In a shell without
  a TTY this fails with `ssh_askpass: ... No such file or directory` rather than
  anything informative.
- The config dir is `~/.config/emacs`, but a few paths still point at
  `~/.emacs.d` (kotlin LSP script, extra snippets dir). Don't copy that pattern
  into new code, and don't assume the two are the same directory.
- `global-display-line-numbers-mode` is on, so terminal-like modes need an
  explicit hook to switch line numbers off.
- Claude Code IDE runs in ghostel (`claude-code-ide-terminal-backend`); vterm
  is still available on `C-c t`.
