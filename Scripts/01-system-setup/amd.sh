#!/usr/bin/env bash

set -euo pipefail

# mesa is the DRI driver for 3D acceleration.
# vulkan-radeon adds Vulkan support.
# libva-mesa-driver adds VA-API accelerated video decoding.
# pkg arch para acceleración que usaba antes: libva-mesa-driver lib32-libva-mesa-driver
# Optional: mesa-vdpau adds VDPAU accelerated video decodin (arch): mesa-vdpau lib32-mesa-vdpau

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

if command -v "pacman" &> /dev/null; then
    if grep -q "mesa-git" /etc/pacman.conf; then
        sudo pacman -S --needed "${pkg_mesa_git[@]}"
    else
        sudo pacman -S --needed "${pkg_mesa[@]}"
    fi

elif command -v "dnf" &> /dev/null; then
    sudo dnf install -y

else
    echo "Distro no soportada."
    exit 1
fi

echo -e "Posees una gráfica AMD Radeon 7000 series? (s/n)"
read -p "> " confirmar_serie
echo ""

confirmar_serie=${confirmar_serie:="N"}

if [[ "$confirmar_serie" == "s" ]] || [[ "$confirmar_serie" == "S" ]]; then
    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet amdgpu.vm_update_mode=3"' \
        /etc/default/grub
fi

echo -e "\nEs necesario un reboot."
