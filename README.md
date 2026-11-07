# dotfiles

Omarchy customizations, managed with [chezmoi](https://chezmoi.io). Secrets never go in here.

The old macOS dotfiles live on the [`macos`](https://github.com/schmijos/dotfiles/tree/macos) branch.

## New laptop

1. Install Omarchy.
2. `omarchy install service 1password`, then sign in to the 1Password app.
3. `omarchy pkg add chezmoi`
4. `chezmoi init --apply --source ~/Work/dotfiles <repo-url>`
   (`--source` because the config expects the repo in ~/Work/dotfiles, not chezmoi's default location.)
   It asks whether this is a Dell XPS 14, installs the extra packages from `.chezmoidata/packages.yaml`
   through `omarchy pkg add` / `omarchy pkg aur add`, writes the config, and runs `mise install`.
5. Secrets by hand: `rclone config` (gdrive), `gh auth login`, and
   `~/.config/restic/work-password` from 1Password.
6. Restore ~/Work, all or in parts (see below).

## Tracking files

~/.config is yours: Omarchy writes its defaults there once at install and never again. Track everything you
want a new laptop to have, including files you never changed. Omarchy migrations sometimes edit them; that shows
up in `chezmoi status`. Omarchy's own defaults live in `/usr/share/omarchy/config` for comparison.

Never track secrets (tokens, keys, credentials). They stay in 1Password.

| What | Command |
|---|---|
| Start tracking a file or directory | `chezmoi add ~/.config/foo/bar.toml` |
| A file whose content differs per machine (paths, hostname) | `chezmoi add --template …`, then put `{{ .chezmoi.homeDir }}` etc. in the source |
| A file the app rewrites itself, only needed once | `chezmoi add --create …` (written if missing, never overwritten) |
| Pick up edits made in ~/.config | `chezmoi re-add` |
| Edit the tracked copy and apply it | `chezmoi edit --apply ~/.config/foo/bar.toml` |
| See what differs between repo and home | `chezmoi status`, `chezmoi diff` |
| Resolve a file changed on both sides | `chezmoi merge ~/.config/foo/bar.toml` |
| Stop tracking (the file in home stays) | `chezmoi forget ~/.config/foo/bar.toml` |
| Find untracked files in a directory | `chezmoi unmanaged ~/.config/foo` |
| New package | add it to `.chezmoidata/packages.yaml`, then `chezmoi apply` |

Then commit and push: `chezmoi git -- add -A`, `chezmoi git -- commit -m "…"`, `chezmoi git -- push`.
The repo lives in ~/Work/dotfiles, so plain git there works too.

`chezmoi add` scans for secrets and warns. Read the warning before committing.
`bin/check` runs shellcheck and the bats tests.

## ~/Work backup

A restic repository (encrypted, deduplicated) at `gdrive:Backups/work`, run daily by
`work-backup.timer`. Secrets in ~/Work are fine there. Build caches are excluded
(`dot_config/restic/work-excludes.txt.tmpl`). For manual restic commands:

    export RESTIC_REPOSITORY=rclone:gdrive:Backups/work RESTIC_PASSWORD_FILE=~/.config/restic/work-password

Once: `(umask 077; head -c 32 /dev/urandom | base64 > ~/.config/restic/work-password)`, save it in 1Password,
`restic init`, then `systemctl --user enable --now work-backup.timer`.

Restore (restoring at `/` fails, because restic would chown /home):

    restic restore latest:$HOME/Work --target ~/Work --overwrite never              # everything
    restic restore latest:$HOME/Work --target ~/Work --overwrite never --include /foo # only ~/Work/foo
