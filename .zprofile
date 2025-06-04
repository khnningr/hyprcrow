# Establece el tty1, como si fuese un display manager.
if [ -z ":0" ] && [ "2" -eq 1 ]; then
 exec Hyprland
fi
