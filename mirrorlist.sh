#!/bin/bash

# Instalación de mirrorlist.

echo -e "\n\tInstalando mirrors"
paru -S --needed rate-mirrors-bin
rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist