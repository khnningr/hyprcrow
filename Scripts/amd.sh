#!/usr/bin/env bash

set -euo pipefail

if command -v "pacman" &> /dev/null; then
    . ./list_arch.sh
    if grep -q "mesa-git" /etc/pacman.conf; then
        sudo pacman -S --needed "${pkg_mesa_git[@]}"
        sudo pacman -S --needed "${pkg_amd_git[@]}"
    else
        sudo pacman -S --needed "${pkg_mesa[@]}"
        sudo pacman -S --needed "${pkg_amd[@]}"
    fi
fi

if command -v "dnf" &> /dev/null; then
    echo "No disponibles."
fi
