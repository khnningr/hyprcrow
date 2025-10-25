#!/usr/bin/env bash

set -euo pipefail

# Dependencias necesarios para mis scripts de Git.

# En está sección se definen funciones para la instalación
# de las dependencias según el gestor de paquetes.
# Sistemas soportados:
# - Arch Linux (pacman)
# - Fedora (dnf)

function instalar_git(){
  if command -v pacman &> /dev/null; then
    sudo pacman -S --needed git
  elif command -v dnf &> /dev/null; then
    sudo dnf install git
  else
    echo "Sistema no soportado"
    exit 1
  fi
}

function instalar_github-cli(){
  if command -v pacman &> /dev/null; then
    sudo pacman -S --needed github-cli
  elif command -v dnf &> /dev/null; then
    sudo dnf install git
  else
    echo "Sistema no soportado"
    exit 1
  fi
}

function instalar_gum(){
  if command -v pacman &> /dev/null; then
    sudo pacman -S --needed gum
  elif command -v dnf &> /dev/null; then
    sudo dnf install gum
  else
    echo "Sistema no soportado"
    exit 1
  fi
}

# En está sección se verifica si estan instaladas las dependencias.

# Verifica si git está instalado
if ! command -v git &> /dev/null; then
  echo "Git (git) no está instalado"
  instalar_git
  clear
fi

# Verifica si gum está instalado
if ! command -v gum &> /dev/null; then
  echo "Gum (gum) no está instalado."
  instalar_gum
  clear
  # echo "Instálalo con: sudo pacman -S gum"
  # exit 1
fi

# Verificar si gh está instalado
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) no está instalado"
    instalar_github-cli
    # echo "Instálalo con: sudo pacman -S github-cli"
    # exit 1
fi


