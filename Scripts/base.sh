#!/usr/bin/env bash

set -euo pipefail

dir_obsidian="$HOME/Obsidian"

mkdir -p "$dir_obsidian/.obsidian/plugins/" "$HOME/.config/obsidian/"

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_base[@]}"
fi
