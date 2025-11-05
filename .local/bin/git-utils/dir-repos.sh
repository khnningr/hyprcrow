#!/usr/bin/env bash

set -euo pipefail

source login.sh

declare -A repositorios=(
	["hyprcrow"]="${HOME}/hyprcrow/"
	["Wallpapers"]="${HOME}/Wallpapers/"
	["kh-home"]="${HOME}/kh-home"
)

for i in "${!repositorios[@]}"; do
	if [[ ! -d "${repositorios[$i]}" ]]; then
		echo "$i ${repositorios[$i]}"
		git clone https://github.com/khnningr/"${i}".git "${repositorios[$i]}"
	fi
done
