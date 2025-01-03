#!/bin/bash

# Select random wallpaper and create color scheme.

wal -q -i ~/Wallpapers/

# Load current pywal color scheme.

source "$HOME/.cache/wal/colors.sh"

# Copy color file to waybar folder.

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar
cp ~/.cache/wal/colors-wlogout.css ~/.config/wlogout
cp ~/.cache/wal/wezterm-wal.toml ~/.config/wezterm/colors/

# Get wallpaper image name.

newwall=$(echo $wallpaper | sed "s|$HOME/Wallpapers/||g")

# Set the new wallpaper.

swww img $wallpaper --transition-step 20 --transition-fps=20
#~/.local/share/bin/reload_waybar.sh

# Send notification.
notify-send "Theme and wallpaper updated" "with image $newwall"

echo "DONE!"
