#!/bin/bash

# openrazer es?
# un esfuerzo liderado por la comunidad 
# para dar soporte a los periféricos 
# Razer en Linux.
# >>Referencia: https://openrazer.github.io/
#
# Arch Linux
#
# En el caso de tener el Kernel Linux Zen:
# sudo pacman -S --needed linux-zen-headers
# En caso de tener otro Kernel, buscar su respectivo headers.
#
# Agregar el usuario actual al grupo plugdev
# sudo gpasswd -a $USER plugdev
#
# Es necesario un reboot antes de instalar openrazer-daemon.
# sudo pacman -S --needed openrazer-daemon
#
# Para tener una interfaz gráfica.
# paru -S --needed razercommander
# Alternativa:
# paru -S --needed polychromatic
#
# ckb-next es?
# Es un controlador de código abierto para teclados y ratones 
# Corsair. Su objtivo es llevar las características del software 
# prpietario CUE de Corsair a los sistemas operativos Linux.
# >>Referencia: https://github.com/ckb-next/ckb-next?tab=readme-ov-file
#
# Dependencias.
# sudo pacman -S base-devel cmake libsystemd qt5-base\
# zlib libdbusmenu-qt5 quazip libpulse qt5-tools libxcb\
# xcb-util-wm qt5-x11extras git 
#
# Chaotic-AUR
# sudo pacman -S --needed ckb-next
#
# Activar daemon.
# sudo systemctl enable --now ckb-next-daemon
#
# Si sale el mensaje: "Unit ckb-next-daemon.service is masked.", ejecutar
# antes este otro comando primero:
# sudo systemctl unmask ckb-next-daemon
