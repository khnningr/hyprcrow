#!/usr/bin/env bash

set -euo pipefail

dotfiles="$HOME/hyprcrow/"
dir_obsidian="$HOME/Obsidian"

mkdir -p "$dir_obsidian/.obsidian/plugins/" "$HOME/.config/obsidian/"

mkdir -p ~/.local/share/bin/

mkdir -p ~/.local/share/fonts/

(
    cd "$dotfiles"
    stow .
)
