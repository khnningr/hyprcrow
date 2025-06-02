#!/usr/bin/env bash

set -euo pipefail

dir_obsidian="$HOME"

mkdir -p "$dir_obsidian/Obsidian/.obsidian/plugins"

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_base[@]}"
fi
