#!/usr/bin/env bash

actualizar_repositorio() {
  git pull || exit 1
  if ! grep "email" ~/.gitconfig > /dev/null 2>&1; then
	echo -e "\nIngrese el nombre de usuario"
	read -p "> " MAIL
	git config --global user.email "$MAIL"
  fi
  if ! grep "name" ~/.gitconfig  > /dev/null 2>&1; then
	  echo -e "\nIngrese el nombre de usuario"
	  read -p "> " USUARIO
	  git config --global user.name "$USUARIO"
  fi
  local REPOSITORIO="$1"
  cd "$REPOSITORIO"
  git add .
  echo -e "\n$REPOSITORIO"
  echo -e "Agregar un comentario:"
  read -p "> " COMMIT
  echo
  git commit -m "$COMMIT->$(date +'%Y/%m/%d a las %I:%M %p')"
  git push -u origin main
  echo
  read -p "Repositorio actualizado con exito! Presiona cualquier tecla para salir."
}

actualizar_repositorio ~/Obsidian/

actualizar_repositorio ~/hyprcrow/

actualizar_repositorio ~/kh

actualizar_repositorio ~/Wallpapers/

#actualizar_repositorio ~/Neovim/

#actualizar_repositorio ~/Biblioteca/

actualizar_repositorio ~/Proyectos/
