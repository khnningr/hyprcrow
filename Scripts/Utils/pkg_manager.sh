#!/bin/bash

pkg_manager() {
  if command -v pacman &> /dev/null; then
    pkg_man="pacman"
  elif command -v dnf &> /dev/null; then
    pkg_man="dnf"
  else
    echo -e "\n\fAdminitrador de paquetes no identificado."
  fi
}
