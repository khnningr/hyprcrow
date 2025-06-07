#!/usr/bin/env bash

set -euo pipefail

if ! command -v firewalld &> /dev/null; then
    . ./firewalld.sh
fi

if ! systemctl list-units --type=service | grep -q "firewalld.service"; then
    systemctl enable --now firewalld
fi

if ! firewall-cmd --get-zones | grep -qw "crow"; then
    sudo firewall-cmd --new-zone=crow --permanent
    sudo systemctl restart firewalld
fi

if ! firewall-cmd --get-default | grep -qw "crow"; then
    ip addr | grep "enp" # Ver la interface del equipo.

    echo -e "\nEscriba la interface de la máquina"
    echo "...dada por 'ip addr'"
    read -p "> " elegir_interface

    if [[ -z $elegir_interface ]]; then
        echo "Interface no definida... vuelva intentarlo..."
        exit 1
    fi

    sudo firewall-cmd --zone=crow --change-interface=${elegir_interface}
    sudo firewall-cmd --set-default=crow
fi

# Array con los puertos
puertos=(
    "53"

)
# For que itere entre los puertos
# if con firewall-cmd --list-port | grep -qw ${puerto}
if ! sudo firewall-cmd --list-port | grep -qw "53/tcp"; then
    sudo firewall-cmd --add-port=53/tcp # DNS
fi
# anidado en el if, comando para definir puertos

# Hacer lo mismo con los servicios

# HTTPS
sudo firewall-cmd --add-service=https

# Warframe
sudo firewall-cmd --add-port=4950/tcp
sudo firewall-cmd --add-port=4955/tcp
sudo firewall-cmd --add-port=6695/tcp
sudo firewall-cmd --add-port=6696/tcp
sudo firewall-cmd --add-port=6697/tcp
sudo firewall-cmd --add-port=6698/tcp
sudo firewall-cmd --add-port=6699/tcp
# torrents
sudo firewall-cmd --add-port=51413/tcp
# Block ping
sudo firewall-cmd --add-icmp-block=echo-request

sudo firewall-cmd --runtime-to-permanent

sudo firewall-cmd --reload
sudo systemctl restart firewalld
