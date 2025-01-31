#!/bin/bash

hellwal -i $1
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