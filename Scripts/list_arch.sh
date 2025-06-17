#!/usr/bin/env bash

set -euo pipefail

# Apariencia
pkg_theme=(
	"qt5ct"
	"qt6ct"
	"kvantum"
	"kvantum-qt5"
	"qt5-wayland"
	"qt6-wayland"
	"nwg-look"
	"gtk-engine-murrine"
	"gsettings-desktop-schemas"
	"gsettings-system-schemas"
)

pkg_theme_aur=(
    "qt6ct-kde"
	"hellwal"
	"syshud"
	"matugen-bin"
)

pkg_thunar=(
    "xdg-user-dirs"
	"thunar"
	"file-roller"
	"gvfs"
	"gvfs-mtp"
	"thunar-archive-plugin"
	"thunar-media-tags-plugin"
	"thunar-volman"
	"tumbler"
	"ffmpegthumbnailer"
	"libgsf"
)

pkg_gtk=(
	"polkit-gnome"
	"pavucontrol"
	"fragments"
	"foliate"
	"mission-center"
	"evince"
	"gnome-calculator"
	"loupe"
)

pkg_dolphin=(
	"dolphin"
	"ark"
)

# sudo pacman -S --needed --noconfirm "${pkg_dolphin[@]}"

pkg_kde=(
	"qbittorrent"
	"pavucontrol-qt"
	"gwenview"
	"okular"
	"kdenlive"
)

# sudo pacman -S --needed --noconfirm "${pkg_kde[@]}"

pkg_fonts=(
    "zip"
	"unzip"
	"wget"
	"noto-fonts"
	"noto-fonts-emoji"
	"noto-fonts-cjk"
	"noto-fonts-extra"
	"ttf-ms-fonts"
)

pkg_zsh=(
    "stow"
    "zsh"
    "git"
    "fzf"
    "zoxide"
    "oh-my-posh-bin"
    "exa"
    "pokemon-colorscripts-git"
)

# Juegos

pkg_wine=(
	"wine-staging"
	"wine-mono"
	"wine-gecko"
	"winetricks"
)
# Puedes usar el comando 'wine winecfg'
# para configurar Wine con una GUI.

pkg_proton=(
	"steam"
	"protonplus"
	"bottles"
	"heroic-games-launcher-bin"
)

pkg_proton_aur=(
	"protonfixes"
)

# paru -S --needed --noconfirm "${pkg_proton_aur[@]}"

pkg_retro=(
	"retroarch"
	"retroarch-assets-xmb"
	"retroarch-assets-ozone"
)

pkg_mango=(
	"mangohud"
	"lib32-mangohud"
)

# Para usar mango en Steam, usar el comando: 'mangohud %command%'
# Referencias: https://github.com/flightlessmango/MangoHud

pkg_mango_aur=(
	"mangojuice"
)

pkg_mods_aur=(
	"nexusmods-app-bin"
)

# Navegadores
pkg_browser=(
	"vivaldi"
)

# Referencias: https://wiki.archlinux.org/title/Vivaldi

# Social
pkg_msg=(
	"telegram-desktop"
	"vesktop"
)

# Utilidades
pkg_utils=(
	"fragments"
	"kooha"
	"pinta"
	"obsidian"
	"handbrake"
	"btop"
	"obs-studio"
	"ffmpegthumbnailer"
	"zathura"
	"zathura-cb"
	"zathura-pdf-mupdf"
	"imv"
	"copyq"
	"wf-recorder"
)

pkg_utils_aur=(
	"ventoy"
	"calligraphy"
	"headsetcontrol-git"
)

pkg_android=(
	"android-tools"
)

pkg_mesa_git=(
	"mesa-git"
	"lib32-mesa-git"
	"vulkan-radeon-git"
	"lib32-vulkan-radeon-git"
	"llvm-libs-git"
	"lib32-llvm-libs-git"
)

pkg_mesa=(
    "mesa"
    "lib32-mesa"
    "vulkan-radeon"
	"lib32-vulkan-radeon"
	"llvm-libs"
	"lib32-llvm-libs"
)

pkg_base=(
	"wezterm-git"
	"zellij"
	"git"
	"github-cli"
	"curl"
	"wget"
	"nano"
	"neovim"
	"man-db"
	"man-pages"
	"man-pages-es"
	"tldr"
	"p7zip"
	"zip"
	"unzip"
	"unrar"
	"vlc"
	"rate-mirrors"
	"cameractrls"
	"btop"
	"downgrade"
	"ncspot"
	"stow"
	"python-pip"
	"zed"
)

pkg_openrazer=(
	"linux-zen-headers"
	"openrazer-daemon"
)

pkg_openrazer_aur=(
	"razercommander"
	"polychromatic"
)

# Referencias: https://openrazer.github.io/

pkg_ckb_next=(
    "base-devel"
	"cmake"
	"libsystemd"
	"qt5-base"
	"zlib"
	"libdbusmenu-qt5"
	"quazip"
	"libpulse"
	"qt5-tools"
	"libxcb"
	"xcb-util-wm"
	"qt5-x11extras"
	"git"
	"ckb-next"
)

# Referencias: https://github.com/ckb-next/ckb-next?tab=readme-ov-file

pkg_hyprland=(
	"hyprland"
	"gcc"
	"jq"
	"gnu-free-fonts"
	"xdg-desktop-portal-hyprland"
	"xdg-desktop-portal-gtk"
	"xdg-desktop-portal"
	"xdg-user-dirs"
	"hyprpicker"
	"gtk3"
	"gtk4"
	"libnotify"
	"hyprshot"
	"swww"
	"slurp"
	"grim"
	"cliphist"
	"wl-clipboard"
	"hyprcursor"
	"hyprlock"
	"hypridle"
	"libsecret"
	"gnome-keyring"
	"playerctl"
	"udiskie"
	"nwg-dock-hyprland"
	"imagemagick"
)

pkg_waybar=(
	"waybar"
	"swaync"
	"blueman"
	"power-profiles-daemon"
)

pkg_rofi=(
	"rofi-wayland"
	"rofi-emoji"
)

pkg_yazi=(
	"yazi"
	"ffmpeg"
	"ffmpegthumbnailer"
	"p7zip"
	"jq"
	"poppler"
	"fd"
	"ripgrep"
	"fzf"
	"zoxide"
	"imagemagick"
	"xdg-desktop-portal"
	"git"
	"libinih"
	"ninja"
	"meson"
	"scdoc"
	"dragon-drop-git"
	"ouch"
)

pkg_yazi_aur=(
	"xdg-desktop-portal-termfilechooser-hunkyburrito-git"
)

# Services
pkg_bluethooth=(
	"bluez"
	"bluez-utils"
	"blueman"
)

pkg_pipewire=(
	"pipewire"
	"pipewire-alsa"
	"pipewire-audio"
	"pipewire-jack"
	"pipewire-pulse"
	"gst-plugin-pipewire"
	"wireplumber"
	"pamixer"
)

pkg_nm=(
	"networkmanager"
	"network-manager-applet"
	"nm-connection-editor"
)

# sudo pacman -S --needed --noconfirm "${pkg_nm[@]}"

# Firewall
pkg_ufw=(
	"ufw"
	"ufw-extras"
)

pkg_ufw_aur=(
	"ufw-docker-git"
)

pkg_firewalld=(
    "firewalld"
)

# sudo pacman -S --needed --noconfirm "${pkg_ufw_aur[@]}"

pkg_brightness=(
	"brightnessctl"
)

# IDE
pkg_java=(
	"jdk-openjdk"
)

# sudo pacman -S --needed --noconfirm "${pkg_java[@]}"

pkg_python_aur=(
	"idle"
)

# paru -S --needed --noconfirm "${pkg_python_aur[@]}"

pkg_libreoffice=(
	"libreoffice-fresh"
	"libreoffice-fresh-es"
	"hyphen"
	"hyphen-es"
	"mythes-es"
)

pkg_libreoffice_aur=(
	"libreoffice-extension-languagetool"
	"languagetool-ngrams-es"
)

pkg_virt_manager=(
    "virt-manager"
	"qemu-full"
	"vde2"
	"virt-viewer"
    "ebtables"
    "iptables"
    "dnsmasq"
    "bridge-utils"
    "ovmf"
    "swtpm"
    "dmidecode"
    "qemu-common"
    "libvirt"
)

pkg_mimetype=(
    "xdg-utils"
    "plocate" # locate -i «programa»
)
