# Dotfiles Setup with Chezmoi

This repository contains configuration files managed by **chezmoi**. Follow the steps below to clone the repo, install `chezmoi`, and apply your configurations.

## Prerequisites

- Operating System: Linux, macOS, or Windows (WSL2)
- `git` installed
- [chezmoi](https://www.chezmoi.io/) installed
- Internet connection

## Initialize chezmoi with this dotfiles repo
Run:
```bash
chezmoi init https://github.com/K2aze/dotfiles
```

Check what changes that chezmoi will make to your home directory by running:
>```bash
>chezmoi diff
>```

If you are happy with the changes that chezmoi will make then run:
>```
>chezmoi apply -v
>```

If you are not happy with the changes to a file then either edit it with:
>```
>chezmoi edit $FILE
>```
...more [chezmoi quick start](https://www.chezmoi.io/quick-start/)
