#!/bin/bash

function dir_respaldo
{
echo -e "\n\tCopiando archivos de configuración de $1"
cp -rf -v $2 $3
}

function file_respaldo
{
echo -e "\n\tCopiando archivo de configuración de $1"
cp -rf -v $2 $3
}

function respaldar
{
local dotfiles=$HOME/hyprcrow/Dotfiles
local Neovim=$HOME/Neovim
local config=$HOME/.config
local local_bin=$HOME/.local/share/bin

# Estos dotfiles van en la carpeta ~/.config/
dir_respaldo Neovim "$config"/nvim "$Neovim"
dir_respaldo Hyprland "$config"/hypr "$dotfiles"/Hyprland
dir_respaldo Waybar "$config"/waybar "$dotfiles"/Waybar
dir_respaldo udiskie "$config"/udiskie "$dotfiles"/Waybar
dir_respaldo Kitty "$config"/kitty "$dotfiles"/Kitty
dir_respaldo waypaper "$config"/waypaper "$dotfiles"/Waypaper
dir_respaldo rofi "$config"/rofi "$dotfiles"/Rofi
#dir_respaldo tofi "$config"/tofi "$dotfiles"/Tofi
dir_respaldo fastfetch "$config"/fastfetch "$dotfiles"/Fastfetch
dir_respaldo mako "$config"/mako "$dotfiles"/Mako
dir_respaldo wal "$config"/wal "$dotfiles"/Pywal
dir_respaldo xfce4 "$config"/xfce4 "$dotfiles"/Thunar
dir_respaldo wlogout "$config"/wlogout "$dotfiles"/Wlogout
dir_respaldo wezterm "$config"/wezterm "$dotfiles"/Wezterm
dir_respaldo ranger "$config"/ranger "$dotfiles"/Ranger
dir_respaldo swappy "$config"/swappy "$dotfiles"/Swappy
dir_respaldo swaylock "$config"/swaylock "$dotfiles"/Swaylock
dir_respaldo yazi "$config"/yazi "$dotfiles"/Yazi
# https://github.com/GermainZ/xdg-desktop-portal-termfilechooser
# https://www.redditmedia.com/r/hyprland/comments/1ejmxkw/unable_to_change_default_file_chooser/
dir_respaldo xdg-desktop-portal-termfilechooser /usr/share/xdg-desktop-portal-termfilechooser/ "$dotfiles"/Yazi
# dir_respaldo "menus (Dolphin)" "$config"/menus "$dotfiles"/Dolphin
dir_respaldo xdg-desktop-portal "$config"/xdg-desktop-portal "$dotfiles"
dir_respaldo VSCode "$config"/VSCode "$dotfiles"/VSCodium
# Solo un archivo de configuración.
file_respaldo "baloofilerc (Dolphin)" "$config"/baloofilerc "$dotfiles"/Dolphin
file_respaldo "kdeglobals (Dolphin)" "$config"/kdeglobals "$dotfiles"/Dolphin
file_respaldo electron30-flags "$config"/electron30-flags.conf "$dotfiles"/ElectronApps
file_respaldo electron-flags "$config"/electron-flags.conf "$dotfiles"/ElectronApps
file_respaldo spotify-flags "$config"/spotify-flags.conf "$dotfiles"/ElectronApps
file_respaldo vivaldi-stable "$config"/vivaldi-stable.conf "$dotfiles"/ElectronApps
file_respaldo codium-flags "$config"/codium-flags.conf "$dotfiles"/ElectronApps

# Estos dotfiles van en la carpeta ~/.local/share/bin/
file_respaldo default_handlr.sh "$local_bin"/default_handlr.sh "$dotfiles"/Scripts/
file_respaldo gtk_integrado.sh "$local_bin"/gtk_integrado.sh "$dotfiles"/Scripts/
file_respaldo pywal16_swww.sh "$local_bin"/pywal16_swww.sh "$dotfiles"/Pywal/
file_respaldo pywal16_waypaper.sh "$local_bin"/pywal16_waypaper.sh "$dotfiles"/Pywal/
file_respaldo mako_volumen.sh "$local_bin"/mako_volumen.sh "$dotfiles"/Mako/
file_respaldo screenshot.sh "$local_bin"/screenshot.sh "$dotfiles"/Hyprland/
file_respaldo sleep.sh "$local_bin"/sleep.sh "$dotfiles"/Swaylock/
file_respaldo xdg_kitty_exec.sh "$local_bin"/xdg_kitty_exec.sh "$dotfiles"/Kitty/
file_respaldo powermenu_rofi.sh "$local_bin"/powermenu_rofi.sh "$dotfiles"/Rofi/
file_respaldo .zshrc "$HOME"/.zshrc "$dotfiles"/Zsh
}
respaldar