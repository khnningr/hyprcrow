#!/usr/bin/env bash

set -euo pipefail

# Nerdfonts son necesarias.

sudo pacman -S --needed git fzf ripgrep luarocks go neovim  

echo """
MASON (Agregar)

LSP:
→ lua-language-server
→ efm
→ stylua (Formatter)

Linter:
→ luacheck

Formatter:
→ stylua (LSP)
comm -23 <(printf '%s\n' neovim go htop | sort) <(pacman -Qq | sort)
"""


