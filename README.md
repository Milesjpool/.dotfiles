# Dotfiles

## Using GNU Stow (very brief)

- Layout: each top-level directory is a package mirroring `$HOME` (e.g. `nvim/.config/nvim/init.lua`).
- Dry-run and apply all:

```bash
stow -nv -t "$HOME" */   # dry-run
stow -v  -t "$HOME" */   # link all
```

- Unlink and refresh a package:

```bash
stow -D -t "$HOME" <package>
stow -R -t "$HOME" <package>
```

- Adopt existing files into a package (then commit changes):

```bash
stow -v --adopt -t "$HOME" <package>
```

- Optional: add `.stow-local-ignore` (e.g. `.git`, `README.md`).
