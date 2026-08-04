# dotfiles

Cross-platform Windows and Linux dotfiles managed by [chezmoi](https://www.chezmoi.io/) and [mise](https://mise.jdx.dev/).

## Managed configuration

- Starship prompt with PowerShell and Zsh-specific right-prompt behavior
- PowerShell profile with transient prompts, zoxide, mise, and lsd aliases
- Zsh initialization and matching aliases
- mise-managed language runtimes and development package managers
- Git identity and editor through machine-local chezmoi data

Windows Terminal settings, credentials, SSH private keys, tokens, and shell history are intentionally not managed.

## Bootstrap

### Windows

Install Scoop and chezmoi, then initialize the repository:

```powershell
scoop install chezmoi
chezmoi init --apply fileng87
```

The first apply installs core CLI tools through Scoop and installs JetBrainsMono Nerd Font when it is missing.

### Linux

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply fileng87
```

The bootstrap script supports `apt-get`, `dnf`, and `pacman`. The operating system package manager installs general CLI tools such as zoxide, lsd, fzf, ripgrep, and bat. mise only installs development runtimes and their package managers.

## Daily workflow

Preview and apply local changes:

```sh
chezmoi diff
chezmoi apply
```

Edit a managed file:

```sh
chezmoi edit ~/.config/starship.toml
chezmoi diff
chezmoi apply
```

Commit source changes:

```sh
chezmoi cd
git add .
git commit -m "chore: update dotfiles"
git push
```

Update another machine:

```sh
chezmoi update
```

## Machine-local data

During initialization, chezmoi prompts for the Git user name and email address. These values are stored in the local chezmoi configuration and are rendered into `~/.gitconfig`; they are not committed to this repository.
