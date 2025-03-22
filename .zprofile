source ~/.local/share/bin/variables.sh
sh ~/.local/share/bin/terminal.sh

# Está configuración deber ir en: /home/kh/.zprofile
# Establece el tty1, como si fuese un display manager.
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
 exec Hyprland
fi

