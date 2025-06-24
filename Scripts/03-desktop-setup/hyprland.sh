#!/usr/bin/env bash

set -euo pipefail

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_hyprland[@]}"

    sudo pacman -S --needed --noconfirm "${pkg_brightness[@]}"
fi





balooctl6 disable # Desactiva el indexador y buscador de archivos KDE
