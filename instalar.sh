#!/bin/bash

clear

generar_indice() {

  local titulo="$1"
  shift # Elimina el primer argumento, $1.
  local indice=1

  echo -e "\n$titulo"

  for i in "$@"; do
    echo "$indice) $i"
    ((indice++))
  done

  echo -e "\n0) Salir\n"

}

aur_helper() {

  mkdir -p ~/.clone/

  echo -e "¿Cuál gestor de paquetes AUR deseas?"
  echo "1. Paru"
  echo "2. Yay"
  echo "3. Pamac"
  read -p "> " elegir_helper
  echo ""

  if [[ "$elegir_helper" != "1" && "$elegir_helper" != "2" && "$elegir_helper" != "3" ]]; then
    echo -e "Opción selecionada no valida. Saliendo..."
    exit 1
  fi

  if [[ "$elegir_helper" == "1" ]]; then
    elegir_helper="paru-bin"
    echo -e "\nSe instalara Paru..."
    helper="paru"
  fi

  if [[ "$elegir_helper" == "2" ]]; then
    elegir_helper="yay-bin"
    echo -e "\nSe instalara Yay..."
    helper="yay"
  fi

  if [[ "$elegir_helper" == "3" ]]; then
    elegir_helper="pamac"
    echo -e "\nSe instalara Pamac..."
  fi

  cd ~/.clone/
  sudo pacman -S --needed --noconfirm git
  git clone https://aur.archlinux.org/$elegir_helper.git
  cd $elegir_helper
  makepkg -si
  cd ..
  rm -rf $elegir_helper

}

pacman() {

  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'}
  sudo cp ./pacman/pacman.conf /etc/pacman.conf

}

mirrorlist() {

  echo -e "¿Deseas actualizar los mirrorlist? (y/n)"
  read -p "> " actualizar_mirrors
  if [ = "y" ]; then
    "$helper" -S --needed - <./pacman/packages/mirrorlist-aur.txt
    echo "Se instaldo paquete."
  else
    echo "No se ha podido instalar el paquete."
  fi

  rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

}

graficos() {

  echo -e "¿Qué tipo de graficos tienes?"
  echo "1. AMD"
  read -p "> " elegir_graficos
  echo ""

  if [[ "$elegir_graficos" != "1" && "$elegir_graficos" != "2" ]]; then
    echo "Opción selecionada no valida. Saliendo..."
    exit 1
  fi

  if [[ "$elegir_graficos" == "1" ]]; then
    sudo pacman -S --needed --noconfirm - <./pacman/packages/amd_radeon.txt
    echo "Paquetes instalados."
  fi
}

# antes de instalar paquetes, hacer mirrorlist.

paquetes() {

  echo -e "¿Deseas instalar todos los paquetes de estos dotfiles? (y/n)"
  read -p "> " instalar_paquetes
  if [ "$instalar_paquetes" == "y" ]; then
    sudo pacman -S --needed --noconfirm - <./pacman/packages/base.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/hypr.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/shell.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/themes.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/thunar.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/terminal.txt
    sudo pacman -S --needed --noconfirm - <./pacman/packages/terminal-aur.txt
    paru -S --needed --noconfirm - <./pacman/packages/hypr_aur.txt
    echo "Paquetes instalados."
  else
    echo "Paquetes no instalados."
  fi
}

zsh() {

  echo "¿Deseas instalar OH-MY-ZSH? (s/n)"
  read -p "> " elegir_ohmyzsh
  if [[ "$elegir_ohmyzsh" == "s" ]]; then
    sudo pacman -S --needed zsh curl
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  else
    eche "No se ha podido instalar OH-MY-ZSH."
  fi

}

restaurar_dots() {

  echo "¿Deseas copiar los archivos de configuración? (s/n)"
  read -p "> " elegir_restaurar
  if [[ "$elegir_restaurar" == "s" ]]; then
    sudo cp -rf ./configs/.config/* ~/.config/
    cp -rf ./configs/.local/* ~/.local/
    sudo cp -rf ./configs/etc/* /etc/
    cp -rf ./configs/HOME/.* ~/
    sudo cp -rf ./configs/usr/* /usr/
  else
    echo "No se han restaurado los archivos de configuración."
  fi
}

instalar_dots() {
  read -p "¿Deseas instalar los dotfiles? (y/n)" elegir
  if [[ "$elegir" == "y" ]]; then
    aur_helper
    pacman
    graficos
    mirrorlist
    paquetes
    zsh
    restaurar_dots
  else
    echo "Dotfiles no instalados."
  fi
}

while [ true ]; do
  menu_principal=("Gráficos" "AUR Helper" "Pacman" "Actualizar mirrorlist" "Paquetes todos" "Instalar OH-MY-ZSH" "Restaurar archivos de configuración")
  generar_indice "Menu Principal" "${menu_principal[@]}"
  read -p "Seleccione una opción: " elegir

  case $elegir in
  0) break ;;
  1) graficos ;;
  2) aur_helper ;;
  3) pacman ;;
  4) mirrorlist ;;
  5) paquetes ;;
  6) zsh ;;
  7) restaurar_dots ;;
  99) instalar_dots ;;
  esac
done
