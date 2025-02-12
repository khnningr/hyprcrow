#!/bin/bash

function banner
{
    echo -e "\n\t=== === === === === === === === === === ==="
    echo -e "\t=== === ===   HYCROW Arch Linux   === === ==="
	echo -e "\t=== === === === === === === === === === ===\n"
}

chaotic_aur(){

local Dotfiles=$HOME/hyprcrow/Dotfiles

while [ true ]; do

echo -e "\n¿Deseas instalar Chaotic-AUR? (s/n)"
read -p "> " elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo -e "\n\tCopiando el archivo pacman.conf...\n"
sudo cp -v "$Dotfiles"/Pacman/pacman.conf /etc/pacman.conf

sudo pacman -Sy

sudo pacman -S --needed paru

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\tNo sea modificado el archivo."

break

else

echo -e "\tOpción no valida. Intente de nuevo.\n"

fi

done

}

function paquetes_necesarios
{

local elegir=""

while [ true ]; do

echo -e "\nPara estos dotfiles, es necesario instalar algunos paquetes."
echo -e "¿Deseas instalar los paquetes necesarios? (s/n)"
read -p "> " elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

sudo pacman -Syu
# base
# thunar-archive-plugin
sudo pacman -S --needed - < $HOME/hyprcrow/Dotfiles/Pacman/Paquetes/base.txt
sudo pacman -S --needed vesktop rofi-emoji noto-fonts-emoji\
    hyprpicker ncspot protonplus mission-center stow
# hypr
sudo pacman -S --needed - < $HOME/hyprcrow/Dotfiles/Pacman/Paquetes/hypr.txt
# AUR
paru -S --needed hellwal waytrogen \
    syshud gpu-usage-waybar 

#############################
# Establecer Yazi como system file chooser
# Referencia: https://yazi-rs.github.io/docs/tips/
# Referencia: https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser?tab=readme-ov-file#installation

paru -S --needed xdg-desktop-portal-termfilechooser-hunkyburrito-git
sudo pacman -S --needed xdg-desktop-portal libinih ninja meson scdoc git
git clone https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser ~/.clone/xdg-desktop-portal-termfilechooser
sudo cp ~/.clone/xdg-desktop-portal-termfilechooser/termfilechooser.portal /usr/share/xdg-desktop-portal/portals/

find /usr/share/xdg-desktop-portal/portals -name '*.portal' -not -name 'termfilechooser.portal' \
	-exec grep -q 'FileChooser' '{}' \; \
	-exec sudo sed -i'.bak' 's/org\.freedesktop\.impl\.portal\.FileChooser;\?//g' '{}' \;

systemctl --user restart xdg-desktop-portal.service

# Test: GDK_DEBUG=portals  zenity --file-selection

systemctl --user restart xdg-desktop-portal-termfilechooser.service

systemctl --user stop xdg-desktop-portal-termfilechooser.service
/usr/local/libexec/xdg-desktop-portal-termfilechooser -l TRACE -r &
#########

echo -e "\n\tSe han instalado los paquetes necesarios.\n"

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\tNo sea instalados los paquetes."

break

else

echo -e "\tOpción no valida. Intente de nuevo.\n"

fi

done

}

function soporte_videojuegos
{

local elegir=""

while [ true ]; do

echo -e "\nEsta función permite instalar algunos paquetes para juegos."
echo -e "Estos paquetes son necesarios para su soporte."
echo -e "¿Deseas instalar los paquetes? (s/n)"
read -p "> " elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

sudo pacman -S --needed - < $HOME/hyprcrow/Dotfiles/Pacman/Paquetes/videojuegos.txt
# github.com/flightlessmango/MangoHud
sudo pacman -S --needed mangohud lib32-mangohud
paru -S --needed mangojuice
# Comando necesario en steam modo lazamiento: mangohud %command%

echo -e "\n\tSe han instalado los paquetes.\n"

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\tNo sea instalados los paquetes." 

break

else

echo -e "\tOpción no valida. Intente de nuevo."

fi

done

}
