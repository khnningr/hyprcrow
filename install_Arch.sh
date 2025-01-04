#!/bin/bash

# Funciones de PACMAN

pacman_conf(){
	# usar sed: sed -i 's/palabra/sustituir' archivo donde se sustituye.
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


#pacman_conf
