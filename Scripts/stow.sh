#!/usr/bin/env bash

set -euo pipefail

dotfiles="$HOME/hyprcrow/"

[[ ! -d ~/Obsidian/.obsidian/plugins/ ]] || mkdir -p ~/Obsidian/.obsidian/plugins/

[[ ! -d ~/.local/share/bin/ ]] || mkdir -p ~/.local/share/bin/

[[ ! -d ~/.local/share/fonts/ ]] || mkdir -p ~/.local/share/fonts/

(
    cd "$dotfiles"
    stow .
)
