# dotfiles

![Build Status](https://github.com/dotdc/dotfiles/actions/workflows/ci-build.yml/badge.svg)

## Description

My dotfiles, mainly used on Fedora Linux.

## Features

- Backup your current dotfiles to `~/.bak`
- Creates dotfiles as symlinks to this repository
- Automatic install of Vundle & Vim plugins
- Automatic install of VScode extensions

## Requirements

Install the required packages, for Fedora Linux:

```bash
dnf install -y git make tmux vim
```

## Installation

Several installation options:

| Command         | Description                                           |
|-----------------|-------------------------------------------------------|
| `make dotfiles` | Backup current dotfiles in `~/.bak` & install theses  |
| `make vim`      | Configure Vim and install Vundle & Vim plugins        |
| `make vscode`   | Configure VScode & install extensions                 |
| `make all`      | Make all the above                                    |

## Example usage

```console
git clone REPO
cd dotfiles
make dotfiles
```

## Resources

- [dotfiles](https://github.com/dotdc/dotfiles)
- [onedark.vim](https://github.com/joshdick/onedark.vim)
