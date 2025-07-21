#!/usr/bin/env bash

set -euo pipefail


if [[ "$SHELL" == "/bin/zsh" ]]; then
    [[ -f "$HOME/.zprofile" ]] || touch "$HOME/.zprofile"
    if ! grep -q "[[ -z $DISPLAY && $(tty) == /dev/tty1 ]] && exec Hyprland" $HOME/.zprofile; then
        echo "[[ -z "\${DISPLAY}" && \$(tty) == /dev/tty1 ]] && exec Hyprland" >~/.zprofile
    fi
fi



# if ! grep -q "exec Hyprland" $HOME/.zprofile; then
    # cat << EOF >> "$HOME/.zprofile"
# Establece el tty1, como si fuese un display manager.
# if [ -z "\${DISPLAY}" ] && [ "\${XDG_VTNR}" -eq 1 ]; then
    # exec Hyprland
# fi
# EOF
# fi
