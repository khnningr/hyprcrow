#!/bin/bash

clear

source ./base.sh
source ./arch.sh

# Al yo colar doble (()), es decir, paretesis,
# le indica al interprete que es una operación.
#
# En "echo -e ...", se usa para indicarle al interprete,
# que tome /n, como iun salto en renglon.
#
# El $1, $2 o $@ se usa para pasar argumentos a la función, en este caso.
#
# En concreto, $@ se usa para pasar el valor de todos los argumentos,
# en este caso, desde la array.
#
# Es necesario porle "" al $@ porque así respeta los espacios.
#
# Se debe usar llaves, {} para llamar cada dato de la array.
#
# Se usa [@], para introducir todos los datos de la array.
hy_generador_menu(){
  local titulo="$1"
  shift # Elimina el primer argumento, $1 o titulo.
  local num_opcion=1

  echo -e "\n$titulo"

  for opcion in "$@"; do 
    echo "$num_opcion) $opcion"
    ((num_opcion++))
  done

  echo -e "0) Salir"
}

hy_instalacion_automatica_arch(){
  while [ true ]; do
    clear
    echo -e "\nArch Linux - Hyprland"
    echo -e "Estos son mis dotfiles personales."
    echo -e "¿Confirme para instalar de forma automática? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
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
      echo -e "\n\tInstalación completa."
      break 
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\n\tDotfiles no instalados."
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

hy_instalacion_manual_arch(){
  while [ true ]; do
    hy_manual_menu=(
      "Instalar Chaotic-AUR"
      "Actualizar mirrorlist"
      "Soporte a Flatpak"
      "Paquetes necesarios"
      "Enlace simbólico de dotfiles (Stow)"
      "Soporte a videojuegos"
      "Controladores de vídeo"
      "Configurar OH-MY-ZSH"
      "Configurar firewall (ufw)"
      "Selector de display manager"
      "Soporte de plugins (hyprland)"
      "Instalar y configurar Virt-manager"
      "Eliminar pacman-db"
      "Instalación automática"
      )
    hy_generador_menu "Instalación manual de Arch Linux (Hyprcrow)" "${hy_manual_menu[@]}"
    echo -e "Seleccione una opción: "
    read -p "> " elegir
    
    case "$elegir" in
      0) break ;;
      1) arch_chaotic_aur ;;
      2) arch_actualizar_mirrorlist ;;
      3) arch_instalar_flatpak ;;
      4) arch_paquetes_necesarios ;;
      5) base_dotfiles_stow ;;
      6) arch_paquetes_videojuegos ;;
      7) arch_controladores_de_video ;;
      8) arch_zsh ;;
      9) arch_firewall_ufw ;;
      10) arch_display_manager ;;
      11) arch_plugins_hyprland ;;
      12) arch_virt_manager ;;
      13) arch_rm_pacman_db ;;
      14) hy_instalacion_automatica ;;
      *) echo -e "\n\tOpción no valida. Intente de nuevo.\n" ;;
    esac
  done
}

hy_modo_instalacion_arch(){
  while [ true ]; do
    clear
    echo -e "\nInstalación de Arch Linux - Hyprland"
    echo -e "¿Seleccione un modo de instalación?"
    echo "1. Automático"
    echo "2. Manual"
    echo "0. Cancelar"
    read -p "> " elegir
    echo ""

    if [[ "$elegir" == "1" ]]; then
      hy_instalacion_automatica_arch
      break
    elif [[ "$elegir" == "2" ]]; then
      hy_instalacion_manual_arch
    elif [[ "$elegir" == "0" ]]; then 
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

hy_distro(){
  while [ true ]; do
    clear
    echo -e "\n¿Qué distribución tienes?"
    echo "1. Arch Linux"
    echo "2. Fedora - (No sirve de momento)"
    echo "0. Cancelar"
    read -p "> " elegir
    echo ""

    if [[ "$elegir" == "1" ]]; then
      hy_modo_instalacion_arch
    elif [[ "$elegir" == "2" ]]; then
      echo -e "\n\tDe momento no se ha habilitado."
    elif [[ "$elegir" == "0" ]]; then
      clear
      break
    else
      clear
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
} 

hy_distro

