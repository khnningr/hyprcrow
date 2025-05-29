#!/usr/bin/env bash

# Script que permite:
# - Paru
# - Chaotic
# - Mesa.git

tempdir=$(mktemp -d)
trap "rm -rf $tempdir" EXIT

# Paru
# Referencia: https://github.com/Morganamilo/paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git "$tempdir/paru"
cd "$tempdir/paru"
makepkg -si

# Chaotic
# Referencia: https://aur.chaotic.cx
# Acá el codigo.
sudo cp ./pacman/pacman.conf /etc/pacman.conf

# rate-mirrors
sudo pacman -S --needed rate-mirrors

rate-mirrors --allow-root --protocol https arch | \
sudo tee /etc/pacman.d/mirrorlist
