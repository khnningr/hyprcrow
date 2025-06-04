#!/usr/bin/env bash

set -euo pipefail

tempdir=$(mktemp -d)
trap "rm -rf $tempdir" EXIT

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_fonts[@]}"
fi

mkdir -p ~/.local/share/fonts/

wget -O "$tempdir/IosevkaTerm.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IosevkaTerm.zip

unzip -o "$tempdir/IosevkaTerm.zip" -d ~/.local/share/fonts/IosevkaTerm/

wget -O "$tempdir/Hack.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip

unzip -o "$tempdir/Hack.zip" -d ~/.local/share/fonts/Hack/

wget -O "$tempdir/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip

unzip -o "$tempdir/JetBrainsMono.zip" -d ~/.local/share/fonts/JetBrainsMono/

wget -O "$tempdir/Mononoki.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Mononoki.zip

unzip -o "$tempdir/Mononoki.zip" -d ~/.local/share/fonts/Mononoki/

fc-cache -fv
