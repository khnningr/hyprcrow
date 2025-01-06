#!/bin/bash

# https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme

dir_themes=$HOME/.themes
dir_fonts=$HOME/.fonts
dir_icons=$HOME/.icons
Dotfiles=$HOME/hyprcrow/Dotfiles

function verificar_carpetas
{

if [[ -d $dir_themes ]]; then

echo -e "\tYa existe el directorio $dir_themes"

else

mkdir -p $dir_themes

fi

if [[ -d "$dir_icons" ]]; then

echo -e "\tYa existe el directorio ~/.icons"

else

mkdir -p $dir_icons

fi

if [[ -d $dir_fonts ]]; then

echo "Ya existe el directorio $dir_fonts"

else

mkdir -p $dir_fonts

fi

}

function definir_themes
{

sudo pacman -S --needed gtk-engine-murrine

cp -r -v $Dotfiles/Apariencia/Tokyonight-Dark/gtk-4.0 $HOME/.config
cp -r -v $Dotfiles/Apariencia/Tokyonight-Dark $dir_themes

}

function definir_iconos
{

cp -r -v $Dotfiles/Apariencia/Papirus-Dark $HOME/.icons
cp -r -v $Dotfiles/Apariencia/Bibata-Modern-Ice $HOME/.icons

}

function definir_fonts
{

wget -i "$Dotfiles"/Apariencia/fonts.txt

unzip Mononoki.zip -d ~/.fonts/'Mononoki Nerd Font'/
unzip IosevkaTerm.zip -d ~/.fonts/'Iosevka Term Nerd Font'/

rm -rf -v Mononoki.zip
rm -rf -v IosevkaTerm.zip

}
