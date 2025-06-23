#!/usr/bin/env bash

set -euo pipefail

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_libreoffice[@]}"
    paru -S --needed --noconfirm "${pkg_libreoffice_aur[@]}"
fi

if command -v dnf &> /dev/null; then
    . ./list_fedora.sh
    sudo dnf install "${pkg_libreoffice[@]}" -y
    sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
fi
