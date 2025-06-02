#!/usr/bin/env bash

set -euo pipefail

dotfiles="$HOME/hyprcrow/"

[ -d "$dotfiles" ] || {
    exit 1
}

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_zsh[@]}"
fi

[[ ! -f ~/.zshrc ]] || mv ~/.zshrc ~/.zshrc.bak

(
    cd "$dotfiles"
    stow .
)

chsh -s $(which zsh)
