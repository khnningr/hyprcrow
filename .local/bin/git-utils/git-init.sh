#!/usr/bin/env bash

# Este script crea repositorios, pero
# deben estar vacios. Sin readme.

source login.sh

DIR_NUEVO_REPOSITORIO=$(pwd)
USER_NAME=$(git config --global --get user.name)

echo -e "\nhttps://github.com/${USER_NAME}/REPO.git"

echo "Elija el nombre del nuevo repositorio"
NOMBRE_REPO=$(gum input --placeholder "https://github.com/${USER_NAME}/»REPOSITORIO«.git")

NUEVO_REPO="https://github.com/${USER_NAME}/${NOMBRE_REPO}.git"

echo -e "\nURL del repositorio:"
echo -e "> ${NUEVO_REPO}"

cd "$DIR_NUEVO_REPOSITORIO"
git init

source commit.sh "${NOMBRE_REPO}"

git branch -M main
git remote add origin "https://github.com/${USER_NAME}/${NUEVO_REPO}.git"

source push.sh

echo
read -p "Repositorio creado con exito! Presiona cualquier tecla para salir."
