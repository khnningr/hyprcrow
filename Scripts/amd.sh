#!/usr/bin/env bash

set -euo pipefail

if command -v "pacman" &> /dev/null && grep -q "mesa-git" /etc/pacman.conf; then
    . ./list_arch.sh
    sudo pacman -S --needed "${pkg_mesa_git[@]}"
else
    . ./list_arch.sh
    sudo pacman -S --needed "${pkg_mesa[@]}"
fi
