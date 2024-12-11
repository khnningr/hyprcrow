#!/bin/bash

# Funciones de PACMAN

pacman_conf(){
	local elegir
	echo -e "¿Deseas modificar el archivo /etc/pacman.conf? (s/n)"
	read -p "> " elegir

	if [[ "$elegir" == "s" ]]; then
	echo """# Está configuración debe ir en: /etc/pacman.conf
		# Opciones generales
		HoldPkg      = pacman glibc
		Architecture = auto
			
		""" > ~/Documentos/pruebaitexcx.txt
	else
		echo "No sea modificado el archivo."
	fi
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

tty_login(){
clear
local elegir
echo -e "\nEstá función permite establecer el tty1, como si fuese un display manager."
echo -e "¿Deseas modificar el archivo ~/.bash_profile? (s/n)"
read -p "> " elegir

if [[ "$elegir" == "s" ]]; then
echo -e """\n# Está configuración debe ir en: ~/.bash_profile
# Permite establecer el tty1, como si fuese un display manager.
if [ "$(tty)" = "/dev/tty1" ]; then
	exec Hyprland""" >> ~/.bash_profile
cat ~/.bash_profile
echo -e "\n> TTY1, ahora funciona como display manager.\n"
else
echo -e "\nNo se ha modificado el archivo.\n"
fi
}

tty_login
#pacman_conf
