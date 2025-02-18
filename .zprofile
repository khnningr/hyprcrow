# Está configuración deber ir en: /home/kh/.zprofile
# Establece el tty1, como si fuese un display manager.
if [ /dev/pts/3 = /dev/tty1 ]; then
 exec Hyprland
fi
