#!/usr/bin/env bash

dir_clone="$HOME/.clone"
mkdir -p "$dir_clone"

function tokyo_gtk {
  if command -v pacman > /dev/null 2>&1; then
    sudo pacman -S --needed gtk-engine-murrine
  elif command -v dnf > /dev/null 2>&1; then
    sudo dnf install gtk-murrine-engine
  fi
  cd "$dir_clone"
  git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.github
  cd "themes"
  /.install
}


