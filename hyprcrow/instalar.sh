#!/bin/bash

clear

Dotfiles=$HOME/hyprcrow

source "$Dotfiles"/Scripts/pacman.sh
source "$Dotfiles"/Scripts/mirrorlist.sh
source "$Dotfiles"/Scripts/graficos.sh
source "$Dotfiles"/Scripts/flatpak.sh
source "$Dotfiles"/Scripts/display_manager.sh
source "$Dotfiles"/Scripts/zsh.sh
source "$Dotfiles"/Scripts/apariencia.sh
source ./Scripts/plugins_hyprland.sh
source ./Scripts/restaurar_Dotfiles.sh

function generar_indice
{

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

function instalacion_auto
{

local elegir=""

while [ true ]; do

echo -e "\n¿Deseas instalar los dotfiles? (s/n)"
read -p elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

# Primera parte
chaotic_aur
actualizar_mirrorlist
paquetes_necesarios
soporte_videojuegos

# Segunda parte
instalar_controladores

# Tercera parte
soporte_flatpak

# Cuarta parte
display_manager

# Quinta parte
ohmyzsh
verificar_carpetas
definir_themes
definir_iconos
definir_fonts

# Sexta parte
habilitar_plugins
habilitar_hyprexpo
habilitar_hyprspace

# Séptima parte
restaurar_dotfiles

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\n\tDotfiles no instalados."

break

else

echo -e "\n\tOpción no valida. Intente de nuevo.\n"

fi

done

}

function instalacion_manual
{

while [ true ]; do

menu_principal=("Instalar Chaotic-AUR" "Actualizar mirrorlist" "Instalar Hyprland" "Instalar soporte de videojuegos" "Instalar Drivers de video" "Instalar flatpak" "Configurar Display Manager" "Instalar OH-MY-ZSH" "Configurar apariencia" "Soporte de Plugins Hyprland" "Habilitar Hyprexpo" "Habilitar Hyprspace" "Restaurar Dotfiles" "Instalar en modo Automaático")
generar_indice "Menu Principal" "${menu_principal[@]}"
read -p "Seleccione una opción: " elegir

case $elegir in
0) break ;;
1) chaotic_aur ;;
2) actualizar_mirrorlist ;;
3) paquetes_necesarios ;;
4) soporte_videojuegos ;;
5) instalar_controladores ;;
6) soporte_flatpak ;;
7) display_manager ;;
8) ohmyzsh ;;
9) 
verificar_carpetas 
definir_themes
definir_iconos
definir_fonts
;;
10) habilitar_plugins ;;
11) habilitar_hyprexpo ;;
12) habilitar_hyprspace ;;
13) restaurar_dotfiles ;;
14) instalacion_auto ;;
esac

done

}

instalacion_manual

