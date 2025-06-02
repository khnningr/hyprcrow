#!/usr/bin/env bash

set -euo pipefail

tempdir=$(mktemp -d)
trap "rm -rf $tempdir" EXIT

#[[ ! -d ~/.themes ]] || mkdir -p ~/.themes
mkdir -p ~/.themes
[[ ! -d ~/.config/gtk-4.0 ]] || mkdir -p ~/.config/gtk-4.0

git clone https://github.com/0xsch1zo/Kvantum-Tokyo-Night.git "$tempdir/Kvantum-Tokyonight"

cp -r "$tempdir/Kvantum-Tokyonight/Kvantum-Tokyo-Night/" ~/.themes/

git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git "$tempdir/Tokyonight-GTK-Theme"

(
    cd "$tempdir/Tokyonight-GTK-Theme/themes/" && ./install.sh
)
