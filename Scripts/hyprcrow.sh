#!/bin/bash

clear

source ./base.sh
source ./arch.sh

hy_generador_menu(){
  local titulo="$1"
  shift # Elimina el primer argumento, $1 o titulo.
  local num_opcion=1

  echo -e "\n$titulo"

  for opcion in "$@"; do 
    echo "$num_opcion) $opcion"
    ((num_opcion++))
  done

  echo -e "\n0) Salir"
}

hy_distro(){
  while [ true ]; do
    echo -e "¿Qué distribución tienes?"
    echo "1. Arch Linux"
    echo "2. Fedora - (No sirve de momento)"
    read -p "> " elegir
    echo ""

    if [[ "$elegir" == "1" ]]; then
      arch_chaotic_aur
      arch_actualizar_mirrorlist
      arch_instalar_flatpak
      arch_paquetes_necesarios
      base_dotfiles_stow
      arch_paquetes_videojuegos
      arch_controladores_de_video
      arch_zsh
      arch_firewall_ufw
      arch_display_manager
      arch_plugins_hyprland
      arch_virt_manager
      break
    elif [[ "$elegir" == "2" ]]; then
      echo -e "\n\tDe momento no se ha habilitado."
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

hy_instalacion_automatica(){
  while [ true ]; do
    echo -e "\nEstos son mis dotfiles personales."
    echo -e "¿Deseas instalar de forma automática? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      hy_distro
      break 
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\n\tDotfiles no instalados."
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

hy_instalacion_automatica
