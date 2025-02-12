#!/usr/bin/bash

sudo pacman -Syu

# Paquetes necesarios.
sudo pacman -S --needed virt-manager qemu-full vde2\
    virt-viewer ebtables iptables-nft nftables dnsmasq\
    bridge-utils ovmf swtpm dmidecode qemu-common

# Descomentar las lineas 85 y 108.
# unix_socket_group = "libvirt"
# unix_socket_rw_perms = "0770"
sudo nano /etc/libvirt/libvirtd.conf

# Añadir el usuario actual al grupo kvm y libvirt.
sudo usermod -a -G kvm,libvirt $(whoami)

# Cambiar el grupo actual del usuario sin necesidad de cerrar sesion.
newgrp libvirt

# Habilitar servicios necesarios.
sudo systemctl enable --now libvirtd

# Comprobar que se han habilitado los servicios.
sudo systemctl status libvirtd.service

# Descomentar las lineas 519 y 523.
# user = "usuario"
# group = "libvirt"
sudo nano /etc/libvirt/qemu.conf

# Reiniciar el servicio.
sudo systemctl restart libvirtd

# Configurar redes virtuales.
sudo virsh net-autostart default

# Habilitar la virtualización con el firewall habilitado.
# Descomentar linea 29.
# firewall_backend = "iptables"
sudo nano /etc/libvirt/network.conf

# Reiniciar el equipo.
sudo reboot