#!/bin/bash

#WALLPAPER_DIRECTORY=~/Wallpapers

#WALLPAPER=$(find $WALLPAPER_DIRECTORY -type f | shuf -n 1)

#hyprctl hyprpaper preload "$WALLPAPER"
#hyprctl hyprpaper wallpaper ", $WALLPAPER"

#sleep 1

#hyprctl hyprpaper unload unused

export PATH="${PATH}:${HOME}/.local/bin/"

DIR="$HOME/Wallpapers"
PICS=($(ls "$DIR"))

RANDOMPICS="${PICS[$RANDOM % ${#PICS[@]}]}"

if pidof swww >/dev/null; then
  pkill -f swww
  sleep 1
fi

wait

# swww init
swww img "${DIR}/${RANDOMPICS}" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
wait

hellwal -i "${DIR}/${RANDOMPICS}"
wait

# Copiar paletas
cp ~/.cache/hellwal/waybar-colors.css ~/.config/waybar
cp ~/.cache/hellwal/swaync-colors.css ~/.config/swaync
cp ~/.cache/hellwal/hyprland-colors.conf ~/.config/hypr
cp ~/.cache/hellwal/kitty-colors.conf ~/.config/kitty
cp ~/.cache/hellwal/rofi-colors-dark.rasi ~/.config/rofi
cp ~/.cache/hellwal/terminal.sh ~/.local/share/bin
cp ~/.cache/hellwal/variables.sh ~/.local/share/bin
cp ~/.cache/hellwal/wezterm-colors.toml ~/.config/wezterm/colors/
cp ~/.cache/hellwal/syshud-colors.css ~/.config/sys64/hud
# cp ~/.cache/wal/colors-wlogout.css ~/.config/wlogout

killall syshud
wait
syshud -p middle-right -o v -W 350 -H 50 -i 25 -t 2

killall swaync
wait
swaync