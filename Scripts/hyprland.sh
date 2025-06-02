#!/usr/bin/env bash

set -euo pipefail

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_hyprland[@]}"
    sudo pacman -S --needed --noconfirm "${pkg_bluethooth[@]}"
    sudo pacman -S --needed --noconfirm "${pkg_pipewire[@]}"
    sudo pacman -S --needed --noconfirm "${pkg_brightness[@]}"
fi

# Services
# Bluetooth
if ! systemctl list-units --type=service | grep -q "bluetooth.service"; then
    systemctl enable --now bluetooth.service
fi

# Pipewire
# Referencias: https://materiageek.com/como-instalar-y-configurar-pipewire-en-linux/
if ! pactl info | grep -q "Server Name: PulseAudio (on PipeWire"; then
    systemctl --user enable --now pipewire.socket
    systemctl --user enable --now pipewire-pulse.socket
    systemctl --user enable --now wireplumber.service
fi
