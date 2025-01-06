#!/bin/bash

function instalar_controladores
{

local elegir=""

while [ true ]; do

echo -e "¿Qué tipo de gráficos tienes?"
echo "1. AMD"
read -p "> " elegir
echo ""

if [[ "$elegir" == "1" ]]; then

echo -e "\n\tInstalando controladores AMD...\n"
sudo pacman -S --needed - < $HOME/hyprcrow/Dotfiles/Pacman/Paquetes/amd_radeon.txt
echo -e "\n\tSe han instalado los controladores AMD.\n"
break

else

echo -e "\n\tOpción no valida. Intente de nuevo.\n"

fi

done

}