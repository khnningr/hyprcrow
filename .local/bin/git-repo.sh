#!/usr/bin/env bash

actualizar_repositorio() {
  local REPOSITORIO="$1"
  cd "$REPOSITORIO"
  git add .
  echo -e "\n$REPOSITORIO"
  echo -e "Agregar un comentario:"
  read -p "> " COMMIT
  echo
  git commit -m "$COMMIT: $(date +'%Y/%m/%d a las %I:%M %p')"
  git push -u origin main
  echo
  read -p "Repositorio creado con exito! Presiona cualquier tecla para salir."
}

actualizar_repositorio ~/Obsidian/

actualizar_repositorio ~/hyprcrow/

actualizar_repositorio ~/Wallpapers/

#actualizar_repositorio ~/Neovim/

#actualizar_repositorio ~/Biblioteca/

actualizar_repositorio ~/Proyectos/
