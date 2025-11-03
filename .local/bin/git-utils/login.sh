#!/usr/bin/env bash

set -euo pipefail

source dependencias.sh

# Verificar login en GitHub
if ! gh auth status &>/dev/null; then
	echo "No estás autenticado en GitHub"
	if gum confirm "¿Deseas ingresar tu cuenta de GitHub ahora?"; then
		gh auth login
	else
		echo "Autenticación cancelada. No podrás hacer push a GitHub."
		exit 1
	fi
fi

if [ -z $(git config --global --get user.name) ]; then
	USER_NAME=$(gum input --placeholder "Nombre de usuario Git" --prompt "Usuario> ")
	git config --global user.name "$USER_NAME"
fi

if [ -z $(git config --global --get user.email) ]; then
	USER_EMAIL=$(gum input --placeholder "email@ejemplo.com" --prompt "Email> ")
	git config --global user.email "$USER_EMAIL"
fi
