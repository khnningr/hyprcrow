#!/bin/bash

verificar_pkg() {
    local pkg="$1"
    if pacman -Qi "$pkg" &> /dev/null; then
        echo "$pkg ya instalado."
    else
        echo "Instalando $pkg ..."
        sudo  -S --needed "$pkg"
    fi
}

archivo="$HOME/paquetes_favoritos.txt"

while IFS= read -r "pkg"; do
    verificar_pkg "$pkg"
done < archivo

pkg_installed() {
    local PkgIn=$1

    if pacman -Qi "${PkgIn}" &> /dev/null; then
        echo "prueba"
        return 0
    else
        echo "prueba"
        return 1
        
    fi
}

#pkg_installed pkgs