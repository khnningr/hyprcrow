#!/bin/bash
# Script para copiar los dotfiles.

function banner
{
    echo -e "\n\t=== === === === === === === === === === ==="
    echo -e "\t=== === ===   HYCROW Arch Linux   === === ==="
	echo -e "\t=== === === === === === === === === === ===\n"
}

function file-dots
{
local elegir=""
if [ -d "$1" ]; then
echo -e "\n\n\tExiste el directorio $1"
else
echo -e "\n\tEl directorio $1 no existe..."
echo -e "\n\tCreando directorio...\n"
mkdir -p -v "$1"
echo -e "\n\tDirectorio $1 creado\n"
fi
if [ -f "$1/$2" ]; then
echo -e "\n\tExiste el archivo $2"
if [ -f "$1/$2.bak" ]; then
echo -e "\n\tExiste un backup del archivo $2"
while [ true ]; do
echo -e "\n\tDeseas sobreescribir el backup? (s/n)"
read -p "> " elegir
if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
echo -e "\n\tSobreescribiendo backup...\n"
rm -v "$1$2.bak"
echo ""
cp -v "$1$2" "$1$2.bak"
echo -e "\n\tBackup creado... Dentro de $1"
break
elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
echo -e "\n\tBackup no sobreescribido..."
break
else
echo -e "\n\tOpción no valida. Intente de nuevo.\n"
fi
done
else
echo -e "\n\tNo existe el backup..."
echo -e "\n\tCreando backup...\n"
cp -v "$1$2" "$1$2.bak"
echo -e "\n\tBackup creado... Dentro de $1"
fi
echo -e "\n\tCopiando archivo de configuración...\n"
cp -v "$3$2" "$1"
echo -e "\n\tArchivo copiado en el directorio $1\n"
else
echo -e "\n\tEl archivo $2 no existe..."
echo -e "\n\tCopiando archivo de configuración...\n"
cp -v "$3$2" "$1"
echo -e "\n\tArchivo copiado en el directorio $1\n"
fi
}
# $1: Este es el directorio donde se debe ubicar el archivo; Ejemplo: $HOME/.config o ~/.config
# $2: Este es el archivo, o nombre del archivo; Ejemplo: init.lua o baloofilerc
# $3: Este es el directorio donde se encuentra el archivo pero de mis dotfiles; Ejemplo: $HOME/dotfiles/Dotfiles/Kitty/kitty/kitty.conf o $HOME/crow-neovim/nvim nvim/init.lua

function dir-dots
{
local elegir=""
if [ -d "$1" ]; then
echo -e "\n\n\tExiste el directorio $1"
if [ -d "$1/$3.bak" ]; then
echo -e "\n\tExiste el backup dentro de $1"
while [ true ]; do
echo -e "\n\tDeseas sobreescribir el backup? (s/n)"
read -p "> " elegir
if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
echo -e "\n\tSobreescribiendo backup...\n"
rm -rf -v "$1/$3.bak"
echo ""
cp -r -v "$1" "$1.bak"
echo ""
mv -v "$1.bak" "$1"/
echo -e "\n\tBackup creado... Dentro de $1"
break
elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
echo -e "\n\tBackup no sobreescribido..."
break
else
echo -e "\n\tOpción no valida. Intente de nuevo.\n"
fi
done
else
echo -e "\n\tNo existe el backup..."
echo -e "\n\tCreando backup...\n"
cp -r -v "$1" "$1.bak"
echo ""
mv -v "$1.bak" "$1"/
echo -e "\n\tBackup creado... Dentro de $1"
fi
echo -e "\n\tCopiando archivos de configuración...\n"
cp -r -v "$2"/* "$1"/
echo -e "\n\tDotfiles copiados en el directorio $1\n"
else
echo -e "\n\tEl directorio $1 no existe..."
echo -e "\n\tCreando directorio $1"
mkdir -p -v "$1"
echo -e "\n\tDirectorio $1 creado\n"
echo -e "\n\tCopiando archivos de configuración...\n"
cp -r -v "$2"/* "$1"/
echo -e "\n\tDotfiles copiados en el directorio $1\n"
fi
}
# $1: Directorio de los dotfiles; Ejemplo: $HOME/.config/nvim o $HOME/.config/fastfetch
# $2: Mis dotfiles; Ejemplo: config/fastfetch/* o $HOME/crow-neovim/nvim nvim
# $3: Nombre de la carpeta bak; Ejemplo: nvim.bak o fastfetch.bak

function restaurar_dotfiles
{
local dotfiles=$HOME/hyprcrow/Dotfiles
local nvim=$HOME/Neovim
local config=$HOME/.config
local local_bin=$HOME/.local/share/bin
banner
# Estos dotfiles van en la carpeta ~/.config/
dir-dots "$config"/nvim "$nvim"/nvim nvim
dir-dots "$config"/hypr "$dotfiles"/Hyprland/hypr hypr
dir-dots "$config"/waybar "$dotfiles"/Waybar/waybar waybar
dir-dots "$config"/udiskie "$dotfiles"/Waybar/udiskie udiskie
dir-dots "$config"/kitty "$dotfiles"/Kitty/kitty kitty
dir-dots "$config"/waypaper "$dotfiles"/Waypaper/waypaper waypaper
dir-dots "$config"/rofi "$dotfiles"/Rofi/rofi rofi
#dir-dots "$config"/tofi "$dotfiles"/Tofi/tofi tofi
dir-dots "$config"/fastfetch "$dotfiles"/Fastfetch/fastfetch fastfetch
dir-dots "$config"/mako "$dotfiles"/Mako/mako mako
dir-dots "$config"/wal "$dotfiles"/Pywal/wal wal
dir-dots "$config"/xfce4 "$dotfiles"/Thunar/xfce4 xfce4
dir-dots "$config"/wlogout "$dotfiles"/Wlogout/wlogout wlogout
dir-dots "$config"/wezterm "$dotfiles"/Wezterm/wezterm wezterm
dir-dots "$config"/ranger "$dotfiles"/Ranger/ranger ranger
dir-dots "$config"/swappy "$dotfiles"/Swappy/swappy swappy
dir-dots "$config"/swaylock "$dotfiles"/Swaylock/swaylock swaylock
# Despues de "$config"urar bien yazi, hacer un condicional para elegir el filemanager
dir-dots "$config"/yazi "$dotfiles"/Yazi/yazi yazi
sudo cp -rf -v "$dotfiles"/Yazi/xdg-desktop-portal-termfilechooser /usr/share
#dir-dots "$config"/menus "$dotfiles"/Dolphin/menus menus
# En está carpeta hay tres archivos distintos, uno para cada filemanager, usar cada uno dependiendo del filemanager.
# Elegir con base un condicional.
dir-dots "$config"/xdg-desktop-portal "$dotfiles"/xdg-desktop-portal xdg-desktop-portal
dir-dots "$config"/VSCode "$dotfiles"/VSCodium VSCodium
dir-dots "$config"/swaync "$dotfiles/SwayNC/swaync swaync
dir-dots "$config"/hellwal "$dotfiles/Hellwal/hellwal hellwal
file-dots "$config"/baloofilerc "$dotfiles"/Dolphin/
file-dots "$config"/kdeglobals "$dotfiles"/Dolphin/
file-dots "$config"/electron30-flags.conf "$dotfiles"/ElectronApps/
file-dots "$config"/electron-flags.conf "$dotfiles"/ElectronApps/
file-dots "$config"/spotify-flags.conf "$dotfiles"/ElectronApps/
file-dots "$config"/vivaldi-stable.conf "$dotfiles"/ElectronApps/
file-dots "$config"/codium-flags.conf "$dotfiles"/ElectronApps/

# Estos dotfiles van en la carpeta ~/.local/share/bin/
# Es posible que deba sustituir esto para ingresar cada Script dentro de la carpeta del programa.
file-dots "$local_bin"/ default_handlr.sh "$dotfiles"/Scripts/
file-dots "$local_bin"/ gtk_integrado.sh "$dotfiles"/Scripts/ # Integrarlo en Apariencia.
file-dots "$local_bin"/ pywal16_swww.sh "$dotfiles"/Pywal/
file-dots "$local_bin"/ pywal16_waypaper.sh "$dotfiles"/Pywal/
file-dots "$local_bin"/ mako_volumen.sh "$dotfiles"/Mako/
file-dots "$local_bin"/ screenshot.sh "$dotfiles"/Hyprland/
file-dots "$local_bin"/ sleep.sh "$dotfiles"/Swaylock/
file-dots "$local_bin"/ xdg_kitty_exec.sh "$dotfiles"/Kitty/
file-dots "$local_bin"/ powermenu_rofi.sh "$dotfiles"/Rofi/
file-dots "$local_bin"/ variables.sh "$dotfiles"/Hellwal/
file-dots "$local_bin"/ terminal.sh "$dotfiles"/Hellwal/
file-dots "$local_bin"/ swww_hellwal.sh "$dotfiles"/Hellwal/
file-dots "$local_bin"/ waypaper_hellwal.sh "$dotfiles"/Hellwal/
}

restaurar_dotfiles