#!/usr/bin/env bash

# Script que permite:
# - Paru
# - Chaotic
# - Mesa.git

tempdir=$(mktemp -d)
trap "rm -rf $tempdir" EXIT

# Paru
# Referencia: https://github.com/Morganamilo/paru
if ! command -v "paru" &> /dev/null; then
    sudo pacman -S --needed --noconfirm base-devel rustup
    rustup default stable
    (
        git clone https://aur.archlinux.org/paru.git "$tempdir/paru"
        cd "$tempdir/paru" && makepkg -si
    )
fi

# Chaotic
# Referencia: https://aur.chaotic.cx
# Acá el codigo.
if ! grep -q "chaotic-aur" /etc/pacman.conf; then
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key 3056513887B78AEB
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    sudo cp ./pacman.conf /etc/pacman.conf
    sudo pacman -Sy
fi

# rate-mirrors
sudo pacman -S --needed --noconfirm rate-mirrors

rate-mirrors --allow-root --protocol https arch | \
sudo tee /etc/pacman.d/mirrorlist
