#!/usr/bin/env bash

set -euo pipefail

# Nerdfonts son necesarias.

sudo pacman -S --needed git fzf ripgrep luarocks go neovim  

echo """
MASON (Agregar)

LSP:
→ lua-language-server - Lua
→ efm - Servidor multiproposito
→ stylua (Formatter) - Lua
-> pyright - Python
-> typescript-language-server - Typescript Javascript

Linter:
→ luacheck - Lua
-> flake8 - Python
-> eslint_d - Typescript Javascript

Formatter:
→ stylua (LSP) - Lua
-> black - Python
-> prettier - css html json javascript markdown scss typescript yaml
-> fixjason - json
comm -23 <(printf '%s\n' neovim go htop | sort) <(pacman -Qq | sort)
"""


