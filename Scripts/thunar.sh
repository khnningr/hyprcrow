#!/usr/bin/env bash

set -euo pipefail

if command -v "pacman" &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_thunar[@]}"
fi

mkdir -p "$HOME/.config/gtk-3.0"

[[ -f "$HOME/.config/gtk-3.0/bookmarks" ]] || touch "$HOME/.config/gtk-3.0/bookmarks"

function acceso_directo () {
    local dir_acceso=$1
    if [[ -d "$HOME/$dir_acceso" ]] && [[ ! grep -q "$dir_acceso" "$HOME/.config/gtk-3.0/bookmarks" ]]; then
        echo "file:///home/$(whoami)/$dir_acceso" >> "$HOME/.config/gtk-3.0/bookmarks"
    fi
}

acceso_directo "Descargas"
acceso_directo "Documentos"
acceso_directo "Música"
acceso_directo "Vídeos"
acceso_directo "Imágenes"
acceso_directo "Wallpapers"
acceso_directo "hyprcrow"
acceso_directo ".config"
