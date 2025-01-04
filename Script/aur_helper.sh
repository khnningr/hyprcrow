#!/bin/bash

function git_helper
{
local helper="$1"
echo -e "\n\tSe instalara $helper..."
cd ~/.clone/
sudo pacman -S --needed --noconfirm git
git clone https://aur.archlinux.org/"$helper".git
cd "$helper"
makepkg -si
cd ..
rm -rf -v "$helper"
}

chaotic_aur(){
local elegir
echo -e "¿Deseas instalar Chaotic-AUR? (s/n)"
read -p "> " elegir

if [[ "$elegir" == "s" ]]; then
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
    echo "No sea modificado el archivo."
fi
}

aur_helper() {
local elegir=""
local helper=""

mkdir -p -v ~/.clone/

while [ true ]; do
echo -e "¿Cuál gestor de paquetes AUR deseas?"
echo "1. Paru"
echo "2. Yay"
echo "3. Pamac"
read -p "> " elegir
echo ""

if [[ -z "$elegir" || "$elegir" == "1" ]]; then
helper="paru-bin"
git_helper "$helper"
break

elif [[ "$elegir" == "2" ]]; then
helper="yay-bin"
git_helper "$helper"
break

elif [[ "$elegir" == "3" ]]; then
helper="pamac"
git_helper "$helper"
break

elif [[ "$elegir" == "4" ]]; then
helper="chaotic"
break

else
echo -e "\n\tOpción no valida. Intente de nuevo.\n"
fi
done


}

aur_helper