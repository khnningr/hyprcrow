#!/usr/bin/env bash

set -euo pipefail

pkg_utils=(
    "ventoy" # sudo dnf copr enable karlisk/ventoy
    "wf-recorder"
)

# Firewall
pkg_firewalld=(
    "firewalld"
)

pkg_hyprland=(
	"hyprland"
)

pkg_waybar=(
	"waybar"
)

pkg_rofi=(
	"rofi-wayland"
)

pkg_libreoffice=(
    "curl"
    "cabextract"
    "xorg-x11-font-utils"
    "fontconfig"
)
