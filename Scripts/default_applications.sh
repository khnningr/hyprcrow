#!/usr/bin/env bash

set -euo pipefail

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
