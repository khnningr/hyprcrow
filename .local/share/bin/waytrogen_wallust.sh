#!/bin/bash

dir_waytrogen=$(waytrogen --list-current-wallpapers 2>/dev/null)

wallpaper=$(echo "$dir_waytrogen" | jq -r '.[0].path')

echo "$wallpaper"

wallust run "$wallpaper"
wait

killall syshud
wait
syshud -p middle-right -o v -W 350 -H 50 -i 25 -t 2

killall swaync
wait
swaync
