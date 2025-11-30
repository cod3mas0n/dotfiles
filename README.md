# dotfiles

![Build Status](https://github.com/AliMehraji/dotfiles/actions/workflows/ci-build.yml/badge.svg)

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
dnf install -y git make cmake g++ gcc tmux vim
```

## Installation

Several installation options:

| Command         | Description                                           |
|-----------------|-------------------------------------------------------|
| `make dotfiles` | Backup current dotfiles in `~/.bak` & install theses  |
| `make vim`      | Configure Vim and install Vundle & Vim plugins        |
| `make vscode`   | Configure VScode & install extensions                 |

## Example usage

```console
git clone https://github.com/cod3mas0n/dotfiles.git
cd dotfiles
make dotfiles
```

## Resources

- [dotfiles](https://github.com/dotdc/dotfiles)
- [onedark.vim](https://github.com/joshdick/onedark.vim)
