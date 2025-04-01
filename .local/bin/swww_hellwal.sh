#!/bin/bash

# Script para cambiar el fondo de pantalla y actualizar configuraciones
# Requiere: swww, hellwal
# Uso: ./script.sh

set -euo pipefail  # Detener el script si hay un error

# Función para manejar errores
error_handler() {
    notify-send "Error" "El script ha encontrado un error y se detuvo."
    exit 1
}

# Capturar errores
trap 'error_handler' ERR

export PATH="${PATH}:${HOME}/.local/bin/"

DIR="$HOME/Wallpapers"
PICS=($(ls "$DIR"))

RANDOMPICS="${PICS[$RANDOM % ${#PICS[@]}]}"
notify-send ${RANDOMPICS}

# Comprobar herramientas necesarias
check_command() {
    command -v "$1" >/dev/null 2>&1 || { notify-send "Error" "$1 no está instalado. Abortando."; exit 1; }
}

check_command swww
check_command hellwal

# Función para cerrar el proceso swww
estado_swww() {
    if pgrep swww-daemon >/dev/null; then
        swww img "${DIR}/${RANDOMPICS}" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
        notify-send "Fondo de pantalla" "Cambiando el fondo de pantalla a $(basename "$RANDOMPICS")."
    else
        swww-daemon &
        sleep 2 
        notify-send "Proceso no iniciado" "Iniciando el proceso swww-daemon."
        swww img "${DIR}/${RANDOMPICS}" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
        notify-send "Fondo de pantalla" "Cambiando el fondo de pantalla a $(basename "$RANDOMPICS")."
    fi
}

estado_swww

wait

# Ejecutar hellwal
hellwal -i "${DIR}/${RANDOMPICS}"
notify-send "hellwal" "hellwal ejecutado con la imagen: $(basename "$RANDOMPICS")."

# Copiar paletas
cp ~/.cache/hellwal/waybar-colors.css ~/.config/waybar
cp ~/.cache/hellwal/swaync-colors.css ~/.config/swaync
cp ~/.cache/hellwal/hyprland-colors.conf ~/.config/hypr
cp ~/.cache/hellwal/ax-shell-colors.conf ~/.config/Ax-Shell/config/hypr/colors.conf
cp ~/.cache/hellwal/kitty-colors.conf ~/.config/kitty
cp ~/.cache/hellwal/rofi-colors-dark.rasi ~/.config/rofi
cp ~/.cache/hellwal/terminal.sh ~/.local/share/bin
cp ~/.cache/hellwal/variables.sh ~/.local/share/bin
cp ~/.cache/hellwal/wezterm-colors.toml ~/.config/wezterm/colors/
cp ~/.cache/hellwal/syshud-colors.css ~/.config/sys64/hud
cp ~/.cache/hellwal/fabric-colors.css ~/.config/fabric
# cp ~/.cache/wal/colors-wlogout.css ~/.config/wlogout

# Función para reiniciar syshud
reiniciar_syshud() {
    if pgrep syshud >/dev/null; then
        killall syshud
        wait
        notify-send "Syshud" "Syshud cerrado."
    else
        notify-send "Syshud" "Syshud no está en ejecución."
    fi
    syshud -p middle-right -o v -W 350 -H 50 -i 25 -t 2
    notify-send "Syshud" "Syshud reiniciado."
}

# Función para reiniciar swaync
reiniciar_swaync() {
    if pgrep swaync >/dev/null; then
        killall swaync
        wait
        notify-send "Swaync" "Swaync cerrado."
    else
        notify-send "Swaync" "Swaync no está en ejecución."
    fi
    swaync
    notify-send "Swaync" "Swaync reiniciado."
}

# Llamar a las funciones para reiniciar los servicios
reiniciar_syshud
reiniciar_swaync
