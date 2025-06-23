#!/usr/bin/env bash

set -euo pipefail

# Agregar:
# 1. Selección de drivers de vídeo (AMD | Nvidia | Virtual Machine)
echo -e "Tarjeta gráfica (elija una opción)"
echo "1. AMD"
echo "2. Intel"
echo "3. Nvidia"
echo "4. Máquina Virtual"
read -p "> " elegir_drivers
echo ""

elegir_drivers=${elegir_drivers:="1"}

case "$elegir_drivers" in
    1) # Opción AMD
        . ./amd.sh
        ;;
    2) # Opción Intel
        echo "No disponibles."
        ;;
    3) # Opción Nvidia
        echo "No disponibles."
        ;;
    4)
        echo "Agregar paquetes de VM drivers."
        sudo sed -i \
            's/Exec=Hyprland/Exec=env WLR_NO_HARDWARE_CURSORS=1 WLR_RENDERER_ALLOW_SOFTWARE=1 Hyprland/' \
            /usr/share/wayland-sessions/hyprland.desktop
        # Configurar resolución
        echo "monitor = pendiente, 1920x1080@pendiente, auto, auto" > .config/hypr/extra/monitors/VM.conf
        sed -i 's/source = ../extra/monitors/*.conf/source = ../extra/monitors/VM.conf/' \
            "$HOME/.config/hypr/core/monitor.conf"


        ;;
    *) # Opción no válida.
        echo "Opción no válida."
        ;;
esac
