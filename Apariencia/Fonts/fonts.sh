#!/bin/bash

# Pruebas de instalación de fonts.

if [[ ! -f fonts.txt ]]; then
    echo "No existe fichero fonts.txt"
    exit 1
fi

FONT_DIR="$HOME/.fonts"
mkdir -p "$FONT_DIR"

#while read font; do
#    wget $font
#done < fonts.txt

# Condicional de elegir fonts.
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
echo "Fonts copiadas."


unzip Mononoki.zip -d ~/.fonts/'Mononoki Nerd Font'/
rm -rf Mononoki.zip




#
# Ice descarga manual, y revisar el introduccion de textos con """ """
#
#
#
#
