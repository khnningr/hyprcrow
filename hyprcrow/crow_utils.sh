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

# Al yo colar doble (()), es decir, paretesis,
# le indica al interprete que es una operación.
#
# En "echo -e ...", se usa para indicarle al interprete,
# que tome /n, como iun salto en renglon.
#
# El $1, $2 o $@ se usa para pasar argumentos a la función, en este caso.
#
# En concreto, $@ se usa para pasar el valor de todos los argumentos,
# en este caso, desde la array.
#
# Es necesario porle "" al $@ porque así respeta los espacios.

actualizar_sistema() {

  while [ true ]; do

    echo
    read -p "Deseas actualizar el sistema (s/n): " elegir

    if [[ "$elegir" == "s" || "$elegir" == "S" ]]; then
      sudo pacman -Syu && paru -Syu
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\nActualización cancelada."
      break
    else
      echo "\nOpción no valida. Intente de nuevo.\n"
    fi

  done
}

actualizar_repositorio() {
  cd $1
  git add .
  git commit -a -m "Cambio realizado: $(date +'%Y/%m/%d a las %I:%M %p')"
  git push -u origin main
  sleep 10
}

respaldo() {

  DirRespaldo="dotfiles"
  DirRespaldoNeovim=~/crow-neovim/
  while [ true ]; do

    respaldar=("Copiar archivos de configuración personalizados" "Copiar archivos de configuración por defecto")
    generar_indice "Herraminta de respaldo" "${respaldar[@]}"
    read -p "Seleccione una opción: " elegir

    case $elegir in
    0)
      break
      ;;
    1)
      echo -e "\nCopiando archivo de configuración de kitty..."
      cp -rf $HOME/.config/kitty/kitty.conf $HOME/$DirRespaldo/configs/.config/kitty

      echo -e "\nCopiando archivos de configuración de mako..."
      cp -rf $HOME/.config/mako $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración applications.menu...\n(Permite ver los programas que se pueden definir por defecto en Dolphin)."
      cp -rf $HOME/.config/menus/applications.menu $HOME/$DirRespaldo/configs/.config/menus

      echo -e "\nCopiando archivos de configuración de ranger..."
      cp -rf $HOME/.config/ranger $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivo de configuración swappy..."
      cp -rf $HOME/.config/swappy/config $HOME/$DirRespaldo/configs/.config/swappy

      echo -e "\nCopiando archivos de configuración de waybar..."
      cp -rf $HOME/.config/waybar $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivos de configuración de Hyprland..."
      cp -rf $HOME/.config/hypr $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivos de configuración de yazi..."
      cp -rf $HOME/.config/yazi $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración de baloo...\n(Deshabilita el administrador de baloo que viene con KDE)."
      cp -rf $HOME/.config/baloofilerc $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración electron-flags..."
      cp -rf $HOME/.config/electron-flags.conf $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración electron30-flags..."
      cp -rf $HOME/.config/electron30-flags.conf $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración kdeglobals..."
      cp -rf $HOME/.config/kdeglobals $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración vivaldi-stable..."
      cp -rf $HOME/.config/vivaldi-stable.conf $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración chromium-flags..."
      cp -rf $HOME/.config/chromium-flags.conf $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivo de configuración de VSCodium..."
      cp -rf $HOME/.config/VSCodium/User/settings.json $HOME/$DirRespaldo/configs/.config/VSCodium/User/settings.json

      echo -e "\nCopiando el archivo de configuración spotify-flags..."
      cp -rf $HOME/.config/spotify-flags.conf $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración codium-flags..."
      cp -rf $HOME/.config/codium-flags.conf $HOME/$DirRespaldo/configs/.config

      #cp -rf $HOME/Wallpapers $HOME/$DirRespaldo/configs

      echo -e "\nCopiando extensiones de VSCodium al disco duro..."
      cp -rf $HOME/.vscode-oss /run/media/kh/SuciosCuervos/Respaldo/VSCodium/

      echo -e "\nCopiando archivos de acceso .desktop...\n(Dentro de estos archivos, se pueden configurar\ncomportamientos a la hora de abrir un paquete.)"
      cp -rf $HOME/.local/share/applications $HOME/$DirRespaldo/configs/.local/share

      echo -e "\nCopiando archivos de configuración de rofi..."
      cp -rf $HOME/.config/rofi $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivos de configuración de tofi..."
      cp -rf $HOME/.config/tofi $HOME/$DirRespaldo/configs/.config

      # cp -rf $HOME/.config/zathura $HOME/$DirRespaldo/configs/.config
      #

      echo -e "\nCopiando scripts del sistema..."
      cp -rf $HOME/.local/share/bin $HOME/$DirRespaldo/configs/.local/share

      echo -e "\nCopiando archivo de configuración xdg-desktop-portal...\n(Establece el administrador de archivos por defecto\nsegun el entorno o especificación.)"
      cp -rf $HOME/.config/xdg-desktop-portal $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando los templates de pywal16..."
      cp -rf $HOME/.config/wal $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivo de configuración de udiskie..."
      cp -rf $HOME/.config/udiskie/config.yml $HOME/$DirRespaldo/configs/.config/udiskie

      # https://github.com/GermainZ/xdg-desktop-portal-termfilechooser
      # https://www.redditmedia.com/r/hyprland/comments/1ejmxkw/unable_to_change_default_file_chooser/
      echo -e "\nCopiando script de ranger-xdg-desktop-portal-termfilechooser...\n(xdg-desktop-portal-termfilechooser)\n(Establece un administrador de archivos tipo tui.)..."
      cp -rf /usr/share/xdg-desktop-portal-termfilechooser/ranger-wrapper.sh $HOME/$DirRespaldo/configs/usr/share/xdg-desktop-portal-termfilechooser

      echo -e "\nCopiando archivos de configuración de lemurs..."
      cp -rf /etc/lemurs $HOME/$DirRespaldo/configs/etc

      echo -e "\nCopiando archivo de configuración .zshrc..."
      cp -rf $HOME/.zshrc $HOME/$DirRespaldo/configs/HOME

      echo -e "\nCopiando archivo de configuración pacman.conf..."
      cp -rf /etc/pacman.conf $HOME/$DirRespaldo/pacman/

      echo -e "\nCopiando archivo de configuración de variables environment..."
      cp -rf /etc/environment $HOME/$DirRespaldo/configs/etc

      echo -e "\nCopiando archivos de configuración de wlogout..."
      cp -rf $HOME/.config/wlogout $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivos de configuración para temas de GTK-3..."
      cp -rf $HOME/.themes $HOME/$DirRespaldo/configs/HOME

      echo -e "\nCopiando archivos de configuración para temas de GTK-4.0..."
      cp -rf $HOME/.config/gtk-4.0 $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando el archivo de configuración helpers.rc...\n(Configura la función de «Abrir un terminal aquí» en Thunar)."
      cp -rf $HOME/.config/xfce4/helpers.rc $HOME/$DirRespaldo/configs/.config/xfce4

      echo -e "\nCopiando archivo de configuración de waypaper..."
      cp -rf $HOME/.config/waypaper/config.ini $HOME/$DirRespaldo/configs/.config/waypaper

      echo -e "\nCopiando archivo de configuración de swaylock..."
      cp -rf $HOME/.config/swaylock/config $HOME/$DirRespaldo/configs/.config/swaylock

      echo -e "\nCopiando archivos de configuración de wezterm..."
      cp -rf $HOME/.config/wezterm/ $HOME/$DirRespaldo/configs/.config

      echo -e "\nCopiando archivos de configuración de fastfetch..."
      cp -rf $HOME/.config/fastfetch/ $HOME/$DirRespaldo/configs/.config/

      echo -e "\nCopiando archivos de configuración de neovim..."
      cp -rf $HOME/.config/nvim/ $DirRespaldoNeovim
      ;;
    2)
      echo -e "\nCopiando archivos de acceso .desktop de usr a share..."
      cp -rf /usr/share/applications ~/.local/share
      ;;
    esac
  done

}

while [ true ]; do
  menu_principal=("Actualizar paquetes" "Actualizar repositorios" "Administrar respaldos" "Firewall prueba" "Mirrorlist")
  generar_indice "Menu Principal" "${menu_principal[@]}"
  read -p "Seleccione una opción: " elegir

  case $elegir in
  0)
    break
    ;;
  1)
    actualizar_sistema
    ;;
  2)
    echo -e "\nEl vault de Obsidian...\n"
    actualizar_repositorio ~/obsidian_vault/
    echo -e "\nMis dotfiles de Hyprland...\n"
    actualizar_repositorio ~/dotfiles/
    echo -e "\nMis Wallpapers...\n"
    actualizar_repositorio ~/wallpapers/
    echo -e "\nMi Neovim...\n"
    actualizar_repositorio ~/crow-neovim/
    echo -e "\nSe esta subiendo mis proyectos..."
    actualizar_repositorio ~/Proyectos/
    ;;
  3)
    respaldo
    ;;

  esac

done

# Se debe usar llaves, {} para llamar cada dato de la array.
#
# Se usa [@], para introducir todos los datos de la array.
