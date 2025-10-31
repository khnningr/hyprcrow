#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpapers"
THUMB_DIR="$HOME/.local/share/wallpaper-thumbs"
THUMB_SIZE="256x256" # Tamaño de las miniaturas

# Crear directorio de thumbnails si no existe
mkdir -p "$THUMB_DIR"

# Generar thumbnails para cada wallpaper
for img in "$WALLPAPER_DIR"/*.{jpg,png,jpeg,gif}; do
	[ -f "$img" ] || continue

	filename=$(basename "$img")
	thumb_path="$THUMB_DIR/${filename}"

	# Solo generar si no existe o si el original es más nuevo
	if [ ! -f "$thumb_path" ] || [ "$img" -nt "$thumb_path" ]; then
		convert "$img" -resize "$THUMB_SIZE^" -gravity center \
			-extent "$THUMB_SIZE" "$thumb_path"
		echo "Generated thumbnail: $filename"
	fi
done
