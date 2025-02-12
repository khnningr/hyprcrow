#!/bin/bash

# Display manager

function tty_login
{

clear

local elegir

while [ true ]; do

if grep -q "Hyprland" ~/.bash_profile && grep -q "Hyprland" ~/.zprofile; then

echo -e "\n> TTY1, ya funciona como display manager.\n"

break

fi

echo -e "\nEstá función permite establecer el tty1, como si fuese un display manager."
echo -e "¿Deseas modificar el archivo ~/.bash_profile, para bash y ~/.zprofile, para zsh? (s/n)"
read -p "> " elegir

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

echo -e """\n# Está configuración debe ir en: ~/.bash_profile
# Permite establecer el tty1, como si fuese un display manager.
if [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi""" >> ~/.bash_profile
cat ~/.bash_profile

echo -e "\n> TTY1, ahora funciona como display manager.\n"

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\nNo se ha modificado el archivo.\n"

break

else

echo -e "\n\tOpción no valida. Intente de nuevo.\n"

fi

done

}
# Más adelante agregar una función para quitar tty1 como display manager.

function lemurs_login
{
local dotfiles=$HOME/dotfiles/Dotfiles
sudo cp -r -v "$dotfiles"/Lemurs/lemurs /etc/
}

function display_manager
{
local elegir=""
while [ true ]; do
echo -e "\n¿Cuál display manager deseas? Elije uno de los siguientes:"
echo "1. tty"
echo "2. Lemurs"
read -p "> " elegir

if [[ "$elegir" == "1" ]]; then
tty_login
break
elif [[ "$elegir" == "2" ]]; then
sudo pacman -S --needed lemurs
lemurs_login
break
else
echo -e "\n\tOpción no valida. Intente de nuevo.\n"
fi
done
}