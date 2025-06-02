#!/usr/bin/env bash

set -euo pipefail

tempdir=$(mktemp -d)
trap "rm -rf $tempdir" EXIT

[[ ! -d ~/.local/share/icons/ ]] || mkdir -p ~/.local/share/icons/

# Papirus
#wget -qO- https://git.io/papirus-icon-theme-install | sh

git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git "$tempdir/Papirus"
cp -r "$tempdir/Papirus/Papirus" ~/.local/share/icons/
cp -r "$tempdir/Papirus/Papirus-Dark" ~/.local/share/icons/
cp -r "$tempdir/Papirus/Papirus-Light" ~/.local/share/icons/

wget -O "$tempdir/Bibata-Modern-Ice.tar.xz" https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz

tar -xf "$tempdir/Bibata-Modern-Ice.tar.xz" -C ~/.local/share/icons/
