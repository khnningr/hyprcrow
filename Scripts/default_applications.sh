#!/usr/bin/env bash

set -euo pipefail

# Este script define las aplicaciones por defecto, según el
# tipo de archivo es decir, filetype.

# 1. Verificar que programa está asociado al "filetype"
# Para verificar que programa usa para abrir un archivo
# use el comando: 'xdg-mime query default «mimetype»',
# Ejemplo: 'xdg-mime query default image/png'
#
# 2. Verificar que "filetype" tiene un archivo
# Para verificar de qué tipo es un archivo use el comando:
# 'xdg-mime query filetype «archivo»'
# Ejemplo: 'xdg-mime query filetype imagen_de_gatito.png'
#
# 3. Abrir un archivo
# Para abrir un archivo que ya este asociado a un programa
# use el comando:
# 'xdg-open «archivo»'
# Ejemplo: 'xdg-open imagen_de_gatito.png'
#
# 4. Verificar el nombre del programa instalado
# Para verificar como se nombra el programa puedes usa
# el comando:
# 'locate -i «programa».desktop'
# Ejemplo: 'locate -i zed.desktop'
#
# 5. Definir el programa asociado al "filetype"
# Para definir que programa abre el "mimetype" o el
# archivo en si, usa este comando:
# 'xdg-mime default «programa».desktop «mimetype»'
# Ejemplo: 'xdg-mime default feh.desktop image/png'
#
# Referencias: https://youtu.be/z3F0hTigMvU

if command -v pacman &> /dev/null; then
    . ./list_arch.sh
    sudo pacman -S --needed --noconfirm "${pkg_mimetype[@]}"
fi

sudo updatedb

# LibreOffice
xdg-mime default libreoffice-writer.desktop application/vnd.oasis.opendocument.text
xdg-mime default libreoffice-calc.desktop application/vnd.oasis.opendocument.spreadsheet
xdg-mime default libreoffice-impress.desktop application/vnd.oasis.opendocument.presentation

# Zed
xdg-mime default dev.zed.Zed.desktop text/plain
xdg-mime default dev.zed.Zed.desktop application/x-shellscript
xdg-mime default dev.zed.Zed.desktop text/x-python

xdg-mime default org.gnome.Evince.desktop application/pdf

xdg-mime default vivaldi-stable.desktop text/html

# Archivo de imagen
xdg-mime default org.gnome.Loupe.desktop image/bmp
xdg-mime default org.gnome.Loupe.desktop image/gif
xdg-mime default org.gnome.Loupe.desktop image/jpg
xdg-mime default org.gnome.Loupe.desktop image/jpeg
xdg-mime default org.gnome.Loupe.desktop image/png
xdg-mime default org.gnome.Loupe.desktop image/svg+xml
xdg-mime default org.gnome.Loupe.desktop image/tiff

xdg-mime default de.haeckerfelix.Fragments.desktop application/x-bittorrent
xdg-mime default de.haeckerfelix.Fragments.desktop x-scheme-handler/magneta

xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska

xdg-mime default org.gnome.FileRoller.desktop application/zip
xdg-mime default org.gnome.FileRoller.desktop application/x-tar
