#!/usr/bin/env bash

# Este script crea repositorios, pero
# deben estar vacios. Sin readme.

echo -e "\nhttps://github.com/»USUARIO«/REPO.git"
echo -e "Ingrese el nombre del usuario:"
read -p "> " USUARIO
echo -e "\nhttps://github.com/$USUARIO/»REPO«.git"
echo -e "Ingrese el repositorio:"
read -p "> " REPOSITORIO
echo -e "\nURL del repositorio:"
echo -e "> https://github.com/$USUARIO/$REPOSITORIO.git"
DIR_NUEVO_REPOSITORIO=$(pwd)
cd "$DIR_NUEVO_REPOSITORIO"
git init
git add .
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
