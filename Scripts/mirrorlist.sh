#!/bin/bash

function actualizar_mirrorlist
{

local elegir=""

while [ true ]; do

echo -e "\n¿Deseas actualizar los mirrorlist? (s/n)"
read -p "> " elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

echo -e "\n\tInstalando el paquete rate-mirrors...\n"
sudo pacman -S --needed rate-mirrors
echo -e "\n\tSe ha instalado el paquete rate-mirrors.\n"
echo -e "\n\tActualizando los mirrorlist...\n"
rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
echo -e "\n\tSe ha actualizado los mirrorlist."
break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\n\tNo se ha actualizado los mirrorlist.\n"
break

else

echo -e "\n\tOpción no valida. Intente de nuevo.\n"

fi

done

}