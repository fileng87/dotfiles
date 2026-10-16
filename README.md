# dotfiles

Cross-platform Windows and Linux dotfiles managed by [chezmoi](https://www.chezmoi.io/) and [mise](https://mise.jdx.dev/).

## Managed configuration

- Oh My Posh prompt inspired by Powerlevel10k Lean, with a two-line frame, Git status, and time (streaming disabled)
- Previous Starship configuration retained for reference
- PowerShell profile with zoxide, mise, and lsd aliases
- Zsh initialization and matching aliases
- mise-managed language runtimes and development package managers
- Git identity and editor through machine-local chezmoi data
- 小狼毫 (Weasel/Rime) appearance customization (Windows only)

Windows Terminal settings, credentials, SSH private keys, tokens, and shell history are intentionally not managed.

## Bootstrap

### Windows

Install Scoop and chezmoi, then initialize the repository:

```powershell
scoop install chezmoi
chezmoi init --apply fileng87
```

The first apply downloads and silently installs the official Git for Windows installer (if not already present), installs other core CLI tools through Scoop, and installs JetBrainsMono Nerd Font when it is missing. PowerShell 7 is managed separately; the bootstrap does not install it through Scoop.

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
chezmoi edit ~/.config/oh-my-posh/p10k-lean-frame.omp.json
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

## Windows mise shell setup

PowerShell 7 and Windows PowerShell 5.1 use mise activation. In 5.1 the environment updates at the next prompt; immediate directory-change updates require PowerShell 7.

Git Bash loads mise from .bashrc, sourced by .bash_profile for login shells. Use mise 2026.10.11 or newer on Windows; an older installation produced a Windows-style PATH inside Bash and hid tools such as rtk. Update existing Scoop installations with: scoop update mise.

The Windows bootstrap adds %LOCALAPPDATA%\mise\shims to the user PATH for cmd.exe. Shims select project tool versions but do not apply mise [env] variables to the parent shell. Open a new terminal after changing the user PATH.