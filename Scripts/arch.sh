#!/bin/bash

dotfiles=$HOME/hyprcrow
source ./base.sh

# Acá se encuentran las funciones
# para una instalación de hyprland
# en Arch Linux.

# Función de chaotic AUR.
# Referencia: https://github.com/chaotic-aur
arch_chaotic_aur(){
  while [ true ]; do
    echo -e "\n¿Deseas instalar Chaotic-AUR? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
      sudo pacman-key --lsign-key 3056513887B78AEB
      sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
      sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
      echo -e "\n\tCopiando pacman.conf...\n"
      sudo cp -v ./pacman.conf /etc/pacman.conf
      sudo pacman -Sy
      sudo pacman -S --needed paru
      if pacman -Qi paru > /dev/null 2>&1; then
        break 
      fi
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tAbortar instalación..."
      break 
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi 
  done
}

arch_actualizar_mirrorlist(){
  while [ true ]; do
    echo -e "\n¿Deseas actualizar los mirrorlist? (s/n)"
    read -p "> " elegir
    echo ""
    
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      # Notificación.
      sudo pacman -S --needed rate-mirrors
      # Noti
      # Noti
      if pacman -Qi rate-mirrors > /dev/null 2>&1; then
        rate-mirrors --allow-root --protocol https arch | \
        sudo tee /etc/pacman.d/mirrorlist
        break
      fi
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\n\tNo se ha actualizado los mirrorlist.\n"
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_instalar_flatpak(){
  while true; do
    echo -e "\n¿Deseas instalar Flatpak? (s/n)"
    read -p "> " elegir
    echo ""
    
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -S --needed flatpak flatseal pamac
      # Hacer una funcion base para instalar paquetes flatpak.
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then 
      echo -e "\tNo sea instalado flatpak."
      break
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_paquetes_necesarios(){
  while [ True ]; do
    echo -e "\nPara estos dotfiles, es necesario instalar algunos paquetes."
    echo -e "¿Deseas instalar los paquetes necesarios? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -Syu
      
      # Paqutes base.
      # Paquetes omitidos: kitty, vivaldi, wget, yazi, fastfetch
      # spotify-launcher, pitivi, foliate, gimp, btop
      # intellij-idea-community-edition
      sudo pacman -S --needed wezterm-git zellij curl git\
        github-cli man-db man-pages-es tldr nano neovim\
        udiskie p7zip unzip imv zathura zathura-cb\
        zathura-pdf-mupdf vlc telegram-desktop jdk-openjdk\
        obs-studio kooha obsidian fragments handbrake\
        downgrade vesktop ncspot mission-center stow\
        android-tools

      # Paquetes Hyprland.
      # Paquetes omitidos: waybar, thunar, file-roller, 
      sudo pacman -S --needed hyprland gcc gnu-free-fonts\
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk\
        rofi-wayland rofi-emoji noto-fonts-emoji hyprpicker\
        gtk3 swaync swww slurp grim cliphist wl-clipboard\
        libnotify hyprshot polkit-gnome hyprcursor swappy\
        hyprlock hypridle networkmanager network-manager-applet\
        nwg-look dconf-editor gsettings-desktop-schemas\
        gsettings-system-schemas wlogout bluez bluez-utils\
        blueman pipewire pipewire-alsa pipewire-audio\
        pipewire-jack pipewire-pulse gst-plugin-pipewire\
        wireplumber pamixer pavucontrol
      paru -S --needed hellwal waytrogen syshud

      # Configuración de Yazi como file manager principal.
      # Referencia: https://yazi-rs.github.io/docs/tips/
      # Referencia: https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser?tab=readme-ov-file#installation
      sudo pacman -S --needed yazi ffmpeg p7zip jq poppler fd\
        ripgrep fzf zoxide imagemagick xdg-desktop-portal git\
        libinih ninja meson scdoc

      paru -S --needed xdg-desktop-portal-termfilechooser-hunkyburrito-git
      
      base_yazi_portal

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

arch_paquetes_videojuegos(){
  while [ true ]; do
    echo -e "\nEsta función permite instalar algunos paquetes para juegos."
    echo -e "Estos paquetes son necesarios para su soporte."
    echo -e "¿Deseas instalar los paquetes? (s/n)"
    read -p "> " elegir
    echo ""
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then 
      
      sudo pacman -S --needed steam protonplus heroic-games-launcher-bin\
        bottles wine-mono wine-gecko retroarch retroarch-assets-xmb\
        retroarch-assets-ozone

      # Instalar MangoHud.
      # Comando necesario en steam modo lazamiento: mangohud %command%
      # Referencia: github.com/flightlessmango/MangoHud
      sudo pacman -S --needed mangohud lib32-mangohud
      paru -S --needed mangojuice
      break

    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then 
      echo -e "\tNo sea instalados los paquetes." 
      break
    else 
      echo -e "\tOpción no valida. Intente de nuevo."
    fi
  done
}

arch_controladores_de_video(){
  while [ true ]; do
    echo -e "¿Qué tipo de gráficos tienes?"
    echo "1. AMD"
    echo "2. VM"
    read -p "> " elegir
    echo ""

    if [[ "$elegir" == "1" ]]; then 
      sudo pacman -S --needed llvm-libs-git lib32-llvm-libs-git mesa-git\
        lib32-mesa-git vulkan-radeon-git lib32-vulkan-radeon-git
      
      echo -e "\n\tSe han instalado los controladores AMD.\n"
      break
    elif [[ "$elegir" == "2" ]]; then
      sudo pacman -S --needed mesa-git xf86-video-vmware
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_zsh(){
  while [ true ]; do
    echo -e "\n¿Deseas instalar OH-MY-ZSH? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -S --needed zsh curl pokemon-colorscripts-git 
      base_oh_my_zsh
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tNo se ha instalado OH-MY-ZSH.\n"
      break
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_firewall_ufw(){
  while [ true ]; do
    echo -e "\nUFW es un firewall sencillo de configurar."
    echo -e "¿Deseas instalar UFW? (s/n)"
    read -p "> " elegir
    echo ""
    
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -S --needed ufw ufw-extras
      paru -S --needed ufw-docker-git
      if pacman -Qi ufw > /dev/null 2>&1 &&\
        pacman -Qi ufw-extras > /dev/null 2>&1 &&\
        paru -Qi ufw-docker-git > /dev/null 2>&1; then
        base_reglas_ufw
        break
      fi
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tNo se ha instalado OH-MY-ZSH.\n"
      break
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_display_manager(){
  while [ true ]; do
    echo -e "\n¿Cuál display manager deseas?" 
    echo -e "Elije uno de los siguientes:"
    echo "1. tty"
    echo "2. Lemurs"
    read -p "> " elegir
    echo ""

    if [[ "$elegir" == "1" ]]; then
      base_tty_login
      break
    elif [[ "$elegir" == "2" ]]; then
      sudo pacman -S --needed lemurs
      base_lemurs_login
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done

}

arch_plugins_hyprland(){
  while [ true ]; do
    echo -e "\n¿Deseas habilitar el soporte de plugins? (s/n)"
    read -p "> " elegir
    echo ""
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -S --needed cpio meson cmake
      base_plugins_hyprland
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tNo se ha instalado OH-MY-ZSH.\n"
      break
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

arch_virt_manager(){
  while [ true ]; do
    echo -e "\n¿Deseas instalar virt-manager? (s/n)"
    read -p "> " elegir
    echo ""
    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -Syu
      # Paquetes necesarios:
      sudo pacman -S --needed virt-manager qemu-full vde2\
        virt-viewer ebtables iptables-nft nftables dnsmasq\
        bridge-utils ovmf swtpm dmidecode qemu-common libvirt

      base_
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tNo se ha instalado OH-MY-ZSH.\n"
      break
    else
      echo -e "\tOpción no valida. Intente de nuevo.\n"
    fi

  done
  
}
