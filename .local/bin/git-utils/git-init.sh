#!/usr/bin/env bash

# Este script crea repositorios, pero
# deben estar vacios. Sin readme.

source login.sh

DIR_NUEVO_REPOSITORIO=$(pwd)
USER_NAME=$(git config --global --get user.name)

echo -e "\nhttps://github.com/${USER_NAME}/REPO.git"

echo "Elija el nombre del nuevo repositorio"
NUEVO_REPO=$(gum input --placeholder "https://github.com/${USER_NAME}/»REPOSITORIO«.git")

echo -e "\nURL del repositorio:"
echo -e "> https://github.com/${USER_NAME}/${NUEVO_REPO}.git"
exit 0

cd "$DIR_NUEVO_REPOSITORIO"
git init
git add .

source commit.sh "${NUEVO_REPO}"
echo -e "\nAgregar un comentario:"
read -p "> " COMMIT
echo
git commit -m "$COMMIT: $(date +'%Y/%m/%d a las %I:%M %p')"
git branch -M main
git remote add origin "https://github.com/$USUARIO/$REPOSITORIO.git"
git push -u origin main || {
	echo -e "Verifica que haya algún archivo que subir."
	exit 1
}
echo
read -p "Repositorio creado con exito! Presiona cualquier tecla para salir."
