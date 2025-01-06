#!/bin/bash

clear

generar_indice() {

  local titulo="$1"
  shift # Elimina el primer argumento, $1.
  local indice=1

  echo -e "\n$titulo"

  for i in "$@"; do
    echo "$indice) $i"
    ((indice++))
  done

  echo -e "\n0) Salir\n"

}

















instalar_dots() {
  read -p "¿Deseas instalar los dotfiles? (y/n)" elegir
  if [[ "$elegir" == "y" ]]; then
    aur_helper
    pacman
    graficos
    mirrorlist
    paquetes
    zsh
    restaurar_dots
  else
    echo "Dotfiles no instalados."
  fi
}

while [ true ]; do
  menu_principal=("Gráficos" "AUR Helper" "Pacman" "Actualizar mirrorlist" "Paquetes todos" "Instalar OH-MY-ZSH" "Restaurar archivos de configuración")
  generar_indice "Menu Principal" "${menu_principal[@]}"
  read -p "Seleccione una opción: " elegir

  case $elegir in
  0) break ;;
  1) graficos ;;
  2) aur_helper ;;
  3) pacman ;;
  4) mirrorlist ;;
  5) paquetes ;;
  6) zsh ;;
  7) restaurar_dots ;;
  99) instalar_dots ;;
  esac
done
