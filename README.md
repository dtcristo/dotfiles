# Dotfiles

Personal dotfiles for an Arch Linux system.

Clone repo into `~/dotfiles`
```sh
$ git clone https://github.com/dtcristo/dotfiles.git ~/dotfiles
```

For easy installation with symlinks, I use [GNU Stow](https://www.gnu.org/software/stow/).

General stow, from within `~/dotfiles`
```sh
$ stow -v fish
```

Stowing system config into `/etc`
```sh
$ sudo stow -v --target=/etc etc
```
