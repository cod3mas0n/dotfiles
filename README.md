# dotfiles

![Build Status](https://github.com/AliMehraji/dotfiles/actions/workflows/ci-build.yml/badge.svg)

## Description

My dotfiles, mainly used on Fedora Linux.

## Features

- Back up replaced dotfiles to `~/.bak`, with numbered names if a backup already exists
- Creates dotfiles as symlinks to this repository
- Automatic install of Vundle & Vim plugins
- Link VS Code user settings

## Requirements

Install the required packages, for Fedora Linux:

```bash
dnf install -y git make cmake g++ gcc tmux vim
```

## Installation

Several installation options:

| Command               | Description                                      |
|-----------------------|--------------------------------------------------|
| `make help`           | List available targets                           |
| `make all`            | Configure all dotfiles                           |
| `make dotfiles`       | Configure all dotfiles                           |
| `make vim`            | Configure Vim and install Vundle & Vim plugins   |
| `make vscode-configs` | Link VS Code user settings                       |

## Example usage

```console
git clone https://github.com/cod3mas0n/dotfiles.git
cd dotfiles
make all
```

## Resources

- [dotfiles](https://github.com/dotdc/dotfiles)
- [onedark.vim](https://github.com/joshdick/onedark.vim)
