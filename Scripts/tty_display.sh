#!/usr/bin/env bash

set -euo pipefail

[[ -f "$HOME/.zprofile" ]] || touch "$HOME/.zprofile"

if ! grep -q "exec Hyprland" $HOME/.zprofile; then
cat << EOF >> "$HOME/.zprofile"
# Establece el tty1, como si fuese un display manager.
if [ -z "\${DISPLAY}" ] && [ "\${XDG_VTNR}" -eq 1 ]; then
 exec Hyprland
fi
EOF
fi
