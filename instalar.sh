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
source "$Dotfiles"/Scripts/plugins_hyprland.sh
source "$Dotfiles"/Scripts/restaurar_Dotfiles.sh

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

done

}

function instalacion_manual
{
menu_principal=("Instalar Chaotic-AUR" "Actualizar mirrorlist" "Instalar Hyprland" "Instalar soporte de videojuegos" )
generar_indice "Menu Principal" "${menu_principal[@]}"
}