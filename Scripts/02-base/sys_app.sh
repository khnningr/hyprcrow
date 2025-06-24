#!/usr/bin/env bash

set -euo pipefail



pkg_base=(
	"wezterm-git"
	"zellij"
	"git"
	"github-cli"
	"curl"
	"wget"
	"nano"
	"neovim"
	"man-db"
	"man-pages"
	"man-pages-es"
	"tldr"
	"p7zip"
	"zip"
	"unzip"
	"unrar"
	"vlc"
	"cameractrls"
	"btop"
	"downgrade"
	"ncspot"
	"stow"
	"python-pip"
	"zed"
	"openssh"
)

dir_obsidian="$HOME/Obsidian"

mkdir -p "$dir_obsidian/.obsidian/plugins/" "$HOME/.config/obsidian/"

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_base[@]}"
fi
