#!/bin/bash

pkg_aur() {
    local paquete="$1"
    paru -S --needed "$paquete"
}

pkg_pacman() {
    local paquete="$1"
    sudo pacman -S --needed "$paquete"
}

menu_principal=("Instalar Paru" "Mirrorlist" "Pipewire" "Eliminar pacman_db" "Salir")

install_paru() {
    echo -e "\nSe instalara Paru..."
    echo -e "                                     
    ___      ___      __             
  //   ) ) //   ) ) //  ) ) //   / / 
 //___/ / //   / / //      //   / /  
//       ((___( ( //      ((___( (   "
    echo -e "\nIniciando la instalación de Paru...\n"
    sudo pacman -S --needed base-devel rust
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
    echo "Paru ha sido instalado."
}

install_mirrorlist() {
    local mirror="../Scripts/packages/mirrorlist-aur.txt"
    mapfile -t paquete < "$mirror"
    echo -e "\n\tInstalando mirrors"
    for i in "${paquete[@]}"; do
        pkg_aur "$i"
    done
    rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

}

install_pipewire() {
    local pipewire="../Scripts/packages/pipewire.txt"
    echo "$pipewire"
    mapfile -t paquete < "$pipewire"
    echo "$paquete"
    echo -e "\nInstalando Pipewire"
    for i in "${paquete[@]}"; do
        pkg_pacman "$i"
    done
    echo -e "\nHabilitando servicios de Pipewire..."
    systemctl --user enable --now pipewire.socket
    systemctl --user enable --now pipewire-pulse.socket
    systemctl --user enable --now wireplumber.service
    echo -e "\n... por favor reiniciar."
}

rm_pacman_db(){
    sudo rm /var/lib/pacman/db.lck
}

clear
while true; do
    echo "                            
    .--------.-----.-----.--.--.
    |        |  -__|     |  |  |
    |__|__|__|_____|__|__|_____|
                                
    "
    echo -e "Menú principal\n"
    for i in "${!menu_principal[@]}"; do
        echo "$((i+1)). ${menu_principal[$i]}"
    done
    echo
    read -p "Selecciona una opción (1-${#menu_principal[@]}): " choice
    
    case $choice in
        1) install_paru 
        ;;
        2) install_mirrorlist
        ;;
        3) install_pipewire
        ;;
        4) rm_pacman_db
        ;;
        ${#menu_principal[@]}) echo "Saliendo..."; break ;;
        *) echo "Opción inválida" ;;
    esac
    
    echo
done

