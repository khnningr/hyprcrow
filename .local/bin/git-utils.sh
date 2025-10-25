#!/usr/bin/env bash

set -euo pipefail

if ! command -v git &> /dev/null; then
  echo "Git (git) no está instalado"
    echo "Instálalo con: sudo pacman -S git"
    exit 1
fi

if ! command -v gum &> /dev/null; then
  echo "Gum (gum) no está instalado"
    echo "Instálalo con: sudo pacman -S gum"
    exit 1
fi

# Verificar si gh está instalado
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) no está instalado"
    echo "Instálalo con: sudo pacman -S github-cli"
    exit 1
fi
