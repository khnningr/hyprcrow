#!/usr/bin/env bash

verificar() {
  local COMANDO="$1"
  command -v "$COMANDO" >/dev/null 2>&1
}

verificar matugen || {
  notify-send "matugen no instalado" \
  "El paquete matugen no se encuentra instalado."
  #exit 1
}

if verificar pacman; then
	paru -S --needed matugen-bin
else
	cargo install matugen
fi

