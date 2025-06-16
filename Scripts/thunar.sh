#!/usr/bin/env bash

set -euo pipefail

. ./list_arch.sh

sudo pacman -S --needed --noconfirm "${pkg_thunar[@]}"

mkdir -p "$HOME/.config/gtk-3.0"

[[ -f "$HOME/.config/gtk-3.0/bookmarks" ]] || touch "$HOME/.config/gtk-3.0/bookmarks"

function ensure_dependency () {
	local tool=$1
	local install_url=$2
	if ! command -v "$tool" &> /dev/null; then
		echo "Error: $tool is not installed." >&2
		echo "Please install $tool from $install_url" >&2
		exit 1
	fi
}

if [[ -d "$HOME/Documentos" ]] && [[ ! grep -q "Documentos" "$HOME/.config/gtk-3.0/bookmarks" ]]; then
    echo "file:///home/$(whoami)/Documentos" >> "$HOME/.config/gtk-3.0/bookmarks"
fi
